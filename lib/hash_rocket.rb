require "hash_rocket/version"
module HashRocket
  # Your code goes here...
  @file_names = Dir["#{Rails.root}/**/*"]
  def self.convert
    @file_names.each do |fn|
      if fn =~ /\.(rb|erb|haml|spec)/
        begin
          text = File.read(fn)
          without_space = text.scan(/:[a-z]{1,}\ =>/).flatten
          with_space = text.scan(/:[a-z]{1,}\ =>\ /).flatten
          text = organize_symbols(text, without_space, with_space)
          File.open(fn, "w") {|file| file.puts text }
        rescue
          puts "ERROR ON #{fn}"
        end
      end
    end
  end
private
  def self.organize_symbols(text, without_space, with_space)
    text = match_symbols(text, without_space, ": ") if without_space
    text = match_symbols(text, with_space, ":") if with_space
    text
  end
  
  def self.match_symbols(text, strings, comma)
    strings.uniq.each do |str|
      comma, symbol, hash_rocket = str.match(/(^:*)(.+)(\ =>)/i).captures
      text = text.gsub(str, symbol + comma)
    end
    text
  end
private_class_method :organize_symbols, :match_symbols
end
