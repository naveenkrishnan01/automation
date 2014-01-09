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


###############################
# check the tabs for OWN TV
##############################
browser.link(:text, 'OWN TV').click;
sleep 2;
browser.link(:text, 'Full Episodes').click;
sleep 2;
browser.link(:text, 'Videos').click;
sleep 2;
browser.link(:text, 'Shows').click;
sleep 2;
browser.link(:text, 'Schedule').click;
sleep 2;
browser.link(:text, 'Casting Call').click;
sleep 3;
puts "Test is now complete for OWNTV".green
puts "End Time now #{Time.now}".cyan
browser.close
