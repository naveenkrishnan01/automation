require 'rubygems'
require 'date'
require 'colorize'
require 'pry'

fileName = [ File.basename("/Users/nkrishna/output.txt"),
	    File.basename("./workspace/promo.txt"),
            File.basename("./workspace/Requestresponse.txt") ]


fileName.each_with_index do |val,index|
#bindint.pry 
  if File.exists?(val)
      File.delete(val)	
     puts "The output file is deleted before running the automation".green  
   else
    puts "The output file is not found, so nothing to delete, continue automation".red
 end
end 
