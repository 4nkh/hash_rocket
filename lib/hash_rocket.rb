require "hash_rocket/version"
require "iconv"
module HashRocket
  
  if defined?(Rails)
    require "hash_rocket/railtie"
  end
  
  def self.convert(path=nil)
    file_names = path ? path : Dir.glob("**/*")
    file_names.each do |fn|
      if fn =~ /\.(rb|erb|haml|spec)/
        begin
          text = File.read(Rails.root.to_s + "/" + fn)
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

private_class_method :organize_symbols, :match_symbols, :solve_invalid_bit_sequence_in_utf8
end
