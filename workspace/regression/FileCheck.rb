require 'rubygems'
require 'date'
require 'colorize'


fileName= File.basename("/Users/nkrishna/qa/FireFox/output.txt")
 
begin
  File.exists?(fileName)
   File.delete(fileName)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName)     
     puts "The output file is not found, so nothing to delete, continue automation".red
   end      

