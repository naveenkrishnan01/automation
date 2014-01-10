require 'rubygems'
require 'date'
require 'colorize'


fileName= File.basename("../output.txt")
 
begin
  File.exists?(fileName)
   File.delete(fileName)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName)     
     puts "The output file is not found, so nothing to delete, continue automation".red
   end      

fileName1 = File.basename("../PromoFeatures/promo.txt")
 
begin
  File.exists?(fileName1)
   File.delete(fileName1)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName1)     
     puts "The output file is not found, so nothing to delete, continue automation".red
   end      


fileName2 = File.basename("../Request-Response/Requestresponse.txt")
 
begin
  File.exists?(fileName2)
   File.delete(fileName2)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName2)     
     puts "The output file is not found, so nothing to delete, continue automation".red
   end


fileName3 = File.basename("../General_Subscription/output1.txt")
 
begin
  File.exists?(fileName3)
   File.delete(fileName3)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName3)     
     puts "The output file is not found, so nothing to delete, continue automation".red
   end


fileName4 = File.basename("../Sharebar/sharebar.txt")
 
begin
  File.exists?(fileName4)
   File.delete(fileName4)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName4)     
     puts "The output file is not found, so nothing to delete, continue automation".red
   end


fileName5 = File.basename("../Omniture/output1.txt")
 
begin
  File.exists?(fileName5)
   File.delete(fileName5)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName5)     
     puts "The output file is not found, so nothing to delete, continue automation".red
 end
     
 fileName6 = File.basename("../BookFinder/BookFinder.txt")
 
begin
  File.exists?(fileName6)
   File.delete(fileName6)
     puts "The output file is deleted before running the automation".green
     rescue => e
	File.exists?(fileName5)     
 end 
