require "hash_rocket/version"
module HashRocket
  
  if defined?(Rails)
    require "hash_rocket/railtie"
    @file_names = Dir.glob("**/*") 
  end
  
  def self.convert
    @file_names.each do |fn|
      if fn =~ /\.(rb|erb|haml|spec)/
        begin
          text = File.read(Rails.root.to_s + "/" + fn)
          text = organize_symbols(text)
          File.open(fn, "w") {|file| file.puts text }
        rescue 
          puts "ERROR ON #{fn}" 
        end
      end
    end
  end
private
  def self.organize_symbols(text)
    with_space = text.scan(/\ :\w{1,}\ =>\ /).flatten
    text = match_symbols(text, with_space, ":") if with_space

    without_space = text.scan(/\ :\w{1,}\ =>/).flatten
    text = match_symbols(text, without_space, ": ") if without_space
    text
  end
  
  def self.match_symbols(text, strings, comma)
    strings.uniq.each do |str|
      comma, symbol, hash_rocket = str.match(/(^\ :*)(.+)(\ =>)/i).captures
      symbol_wrap = symbol + comma
      text = text.gsub(str, " " + symbol_wrap.gsub(/\ /, ""))
    end
    text 
  end

private_class_method :organize_symbols, :match_symbols
end
