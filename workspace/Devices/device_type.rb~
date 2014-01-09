require 'pry'


class Device_type
   
 attr_accessor :name
 def check_arg(name)
   name = ARGV[0]
   if name == "android_tablet" || name == "iphone" || name == "ipad" || name == "android_phone"
      puts " This is good argument"
   else
      puts "#{name}" + " " + " This is NOT good argument\n"
      puts " Arguments are - iphone, ipad, android_phone, android_tablet "
      exit
   end
    @name = "#{name}"  
 end
end

name = Device_type.new
t = name.check_arg("ARGV[0]")

