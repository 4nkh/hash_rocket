require "hash_rocket/version"
require "hash_rocket/object"
module HashRocket
  
  if defined?(Rails)
    require "hash_rocket/railtie"
  end
  
  def self.convert(folder=nil, path=nil, verbose=nil)
    file_names = path_parameters(folder, path)
    file_names.each do |fn|
      if fn =~ /(Gemfile|\.(erb|rb|html|haml|spec|rake|yml))/
        begin
          text = retreive_file(folder, path, fn)
          text = solve_invalid_byte_sequence_in_utf8(text)
          text = organize_symbols(text, verbose)
          File.open(fn, "w") {|file| file.puts text }
        rescue => e
          puts "ERROR: -------> #{e} .......\n ON THIS FILE: -----> #{fn}" 
        end
      else
        puts "THE FOLLOWING FILE CAN'T BE CONVERTED: -----> #{fn}" if verbose
      end
    end
  end
private
  def self.path_parameters(folder,path)
    return path ? %W(#{path}) : Dir.glob("**/*") unless folder
    return Dir[folder + "/**/*"] if folder
  end

  def self.retreive_file(folder, path, fn)
    return File.read(folder ? fn : Rails.root.to_s + "/" + fn) unless path
    return File.read(path) if path
  end

  def self.solve_invalid_byte_sequence_in_utf8(text)
    if defined?(Rails)
      text.encode!('UTF-16', undef: :replace, invalid: :replace, replace: "")
      return text.encode!('UTF-8')
    else
      return text
    end
  end

  def self.organize_symbols(text, verbose)
    # TODO replace the duplicated regez part to include first_liner symbol to parse
    result = text.scan(/([^:]:\w{1,}(\ {1,}|[\ {1,}]?)=>(\ {1,}|[\ ]?))|(^:\w{1,}(\ {1,}|[\ {1,}]?)=>(\ {1,}|[\ ]?))/).flatten
    text = match_symbols(text, result, verbose) if result
    text
  end
  
  def self.match_symbols(text, strings, verbose)
    strings.uniq.each do |str|
      unless str.blank?
        puts str if verbose
        start, garbage, symbol, hash_rocket = str.match(/((^.{1,}:)|:)(.+)((\ {1,}|[\ {1,}]?)=>(\ {1,}|[\ ]?))/).captures
        space = return_space(start.gsub(":",""))
        text = text.gsub(str, space + symbol.gsub(/\ /, "") + ": ")
      end
    end
    text 
  end
  
  def self.return_space(data)
    if data == ""
      "\n"
    elsif data != " "
      data + " "
    else
      data
    end  
  end
private_class_method :path_parameters, :retreive_file, :solve_invalid_byte_sequence_in_utf8, :organize_symbols, :match_symbols, :return_space
end
