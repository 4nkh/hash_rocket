require "hash_rocket/version"
require "iconv"
require "hash_rocket/object"
module HashRocket
  
  if defined?(Rails)
    require "hash_rocket/railtie"
  end
  
  def self.convert(folder=nil, path=nil)
    file_names = path_parameters(folder, path)
    file_names.each do |fn|
      if fn =~ /\.(rb|erb|haml|html|spec)/
        begin
          text = retrieve_file(folder, path, fn)
          text = solve_invalid_bit_sequence_in_utf8(text)
          text = organize_symbols(text)
          File.open(fn, "w") {|file| file.puts text }
        rescue 
          puts "ERROR ON #{fn}" 
        end
      end
    end
  end
private
  def self.path_parameters(folder,path)
    return path ? %W(#{path}) : Dir.glob("**/*") unless folder
    return Dir[folder + "/**/*"] if folder
  end

  def self.retrieve_file(folder, path, fn)
    return File.read(folder ? fn : Rails.root.to_s + "/" + fn) unless path
    return File.read(path) if path
  end

  # TODO use String#encode instead of Iconv
  def self.solve_invalid_bit_sequence_in_utf8(text)
    ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
    return ic.iconv(text)
  end

  def self.organize_symbols(text)
    result = text.scan(/((\ |^(?!::)):\w{1,}(\ {1,}|[\ {1,}]?)=>(\ {1,}|[\ {1,}]?))/).flatten
    text = match_symbols(text, result) if result
    text
  end
  
  def self.match_symbols(text, strings)
    strings.uniq.each do |str|
      unless str.blank?
        start, symbol, hash_rocket = str.match(/(^\ ?:*)(.+)((\ {1,}|[\ {1,}]?)=>(\ {1,}|[\ {1,}]?))/).captures
        text = text.gsub(str, start.gsub(':','') + symbol.gsub(/\ /, "") + ": ")
      end
    end
    text 
  end

private_class_method :path_parameters, :retrieve_file, :organize_symbols, :match_symbols, :solve_invalid_bit_sequence_in_utf8
end
