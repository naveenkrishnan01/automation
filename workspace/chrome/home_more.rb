#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'

puts "Starting Time now #{Time.now}".cyan
  
browser = Watir::Browser.new :chrome 

browser.goto 'www.oprah.com';
browser.cookies.clear

#f = File.open('output.txt', 'w')
#f.puts "open the file"

sleep 5;
#begin
###############################
# check the tabs for OWN TV
##############################
browser.link(:text, 'More').click;
sleep 3;
browser.link(:text, 'Home & Garden').click;
sleep 3;
browser.link(:text, 'More').click;
sleep 3;
browser.link(:text, 'Money').click;
sleep 3;
browser.link(:text, 'More').click;
sleep 3;
browser.link(:text, 'Exclusives').click;
sleep 3;
browser.link(:text, 'More').click;
sleep 3;
browser.link(:text, 'Community').click;
sleep 3;
puts "Test is now complete for More drop down list in Home ".green
puts "End Time now #{Time.now}".cyan
browser.close

#rescue Exception => e
#  puts "Error message :"
#  puts e
#browser.close
#end
