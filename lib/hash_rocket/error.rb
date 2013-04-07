class Error < Exception
  def self.process_error(e, fn) 
  	puts "ERROR: -------> #{e} .......\nON THIS FILE: -----> #{fn}" 
  end

  def self.unprocessable_file(fn)
  	puts "THE FOLLOWING FILE CAN'T BE CONVERTED: -----> #{fn}"
  end
end  