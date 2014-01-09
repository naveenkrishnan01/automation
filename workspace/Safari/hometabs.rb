#!/usr/bin/env ruby

require 'rubygems'

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
# check the tabs for Spirit, Health
##############################
browser.link(:text, 'Spirit').click;
sleep 2;
browser.link(:text, 'Health').click;
sleep 2;
browser.link(:title, 'Relationships').click;
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
f.puts "Test is now complete for home tabs"
puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
browser.close
f.close

rescue Exception => e
  puts "Error message :"
  f.puts "Error message :"
  puts e
  f.puts e
browser.close
f.close
end








