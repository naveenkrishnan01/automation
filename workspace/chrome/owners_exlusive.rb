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
# check owners exclusive
##############################
browser.img(:src, 'http://static.oprah.com/images/own/2013/supersoulsunday/20130623/20130623-sss-india-arie-8-300x205.jpg').click;



browser.link(:href, 'http://www.oprah.com').click;
browser.img(:src, 'http://static.oprah.com/images/own/2013/lovethyneighbor/20130506-ltn-tp-funny-30-300x205.jpg').click;
#browser.link(:href, 'http://www.oprah.com/index.html').click;

	
puts "Test is now complete for owners exclusive".green
puts "End Time now #{Time.now}".cyan
#browser.close


rescue Exception => e
  puts "Error message :"
  puts e
browser.close
end








