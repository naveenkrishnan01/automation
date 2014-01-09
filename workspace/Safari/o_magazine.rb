#!/usr/bin/env ruby

require 'rubygems'
require 'selenium-webdriver'
require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'

configuration = JSON.parse(File.read('./conf.json'))
url = configuration ["url"]

f = File.open('output.txt', 'a')
puts "open the file"

puts "Starting Time now #{Time.now}".cyan
f.puts "Starting Time now #{Time.now}"
  
browser = Watir::Browser.new 

browser.goto "#{url}";
browser.cookies.clear

begin
###############################
# check the links for Oprah next chapter
##############################
browser.link(:text, "O Magazine").click;

browser.image(:id, 'popular_image').click;
puts 'Featured link successful'.green
f.puts 'Featured link successful'
sleep 3;
browser.image(:id, 'see_all_image').click;
puts 'Newest link successful'.green
f.puts 'Newest link successful'
sleep 5;
browser.span(:text, 'NEXT').fire_event("onclick");
puts "Page 2 pagination done".green
f.puts "Page 2 pagination done";
#sleep 3;
 
sleep 3;
puts "Test is now complete for o_magazine".green
f.puts "Test is now complete for o_magazine"
puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
browser.close
f.close

rescue Exception => e
  puts "Error message :"
  f.puts "Error message :"
  puts e
  f.puts e
  f.close
browser.close
end
