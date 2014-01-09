#!/usr/bin/env ruby

require 'rubygems'
require 'selenium-webdriver'
require 'watir-webdriver'
require 'colorize'
require 'date'

puts "Starting Time now #{Time.now}".cyan
  
browser = Watir::Browser.new :chrome 

browser.goto 'www.oprah.com';
browser.cookies.clear

#f = File.open('output.txt', 'w')
#f.puts "open the file"
sleep 3;
begin
###############################
# check the links for Oprah next chapter
##############################
browser.link(:text, "O Magazine").click;
sleep 3;
browser.image(:src, 'http://www.oprah.com/images/feed/Sort_Feed_Active_Featured.png').click;
puts 'Featured link successful'.green
sleep 3;
browser.image(:id, 'see_all_image').click;
puts 'Newest link successful'.green
sleep 5;
browser.span(:text, 'NEXT').fire_event("onclick");
puts "Page 2 pagination done".green
sleep 3;
puts "Test is now complete for o_magazine".green
puts "End Time now #{Time.now}".cyan
browser.close

rescue Exception => e
  puts "Error message :"
  puts e
browser.close
end
