#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'

puts "Starting Time now #{Time.now}".cyan
  
browser = Watir::Browser.new 

browser.goto 'www.oprah.com';
browser.cookies.clear

#f = File.open('output.txt', 'w')
#f.puts "open the file"

begin
###############################
# check on more oprah video
##############################
browser.link(:href, 'http://www.oprah.com/own-super-soul-sunday/IndiaAries-First-Oprah-Show-Appearance-Video').click;
sleep 2;
	
puts "Test is now complete for more oprah video".green
puts "End Time now #{Time.now}".cyan
browser.close


rescue Exception => e
  puts "Error message :"
  puts e
browser.close
end








