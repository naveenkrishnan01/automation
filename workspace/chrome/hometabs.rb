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

begin
###############################
# check the tabs for Spirit, Health
##############################
browser.link(:text, 'Spirit').click;
sleep 2;
browser.link(:text, 'Health').click;
sleep 2;
browser.link(:href, 'http://www.oprah.com/relationships.html').click;
sleep 2;
browser.link(:text, 'Fashion & Beauty').click;
sleep 2;
browser.link(:text, 'Books').click;
sleep 2;
browser.link(:text, 'Food').click;
sleep 2;
browser.link(:text, 'Entertainment').click;
sleep 3;
	
puts "Test is now complete for home tabs".green
puts "End Time now #{Time.now}".cyan
browser.close


rescue Exception => e
  puts "Error message :"
  puts e
browser.close
end








