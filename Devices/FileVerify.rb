require 'rubygems'
require 'date'
require 'colorize'


fileName= File.basename("/Users/nkrishna/qa/FireFox/Regression/output.txt")
 
begin
  File.exists?(fileName)
   File.delete(fileName)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName)     
     puts "The output file is not found, so nothing to delete, continue automation".red
   end      

fileName1 = File.basename("/Users/nkrishna/qa/FireFox/Regression/PromoFeatures/promo.txt")
 
begin
  File.exists?(fileName1)
   File.delete(fileName1)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName1)     
     puts "The output file is not found, so nothing to delete, continue automation".red
   end      


fileName2 = File.basename("/Users/nkrishna/qa/FireFox/Regression/Request-Response/Requestresponse.txt")
 
begin
  File.exists?(fileName2)
   File.delete(fileName2)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName2)     
     puts "The output file is not found, so nothing to delete, continue automation".red
   end


fileName3 = File.basename("/Users/nkrishna/qa/FireFox/Regression/General_Subscription/output1.txt")
 
begin
  File.exists?(fileName3)
   File.delete(fileName3)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName3)     
     puts "The output file is not found, so nothing to delete, continue automation".red
   end


fileName4 = File.basename("/Users/nkrishna/qa/FireFox/Regression/Sharebar/sharebar.txt")
 
begin
  File.exists?(fileName4)
   File.delete(fileName4)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName4)     
     puts "The output file is not found, so nothing to delete, continue automation".red
   end


fileName5 = File.basename("/Users/nkrishna/qa/FireFox/Regression/Devices/device_output.txt")
 
begin
  File.exists?(fileName5)
   File.delete(fileName5)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName5)     
     puts "The output file is not found, so nothing to delete, continue automation".red
   end






