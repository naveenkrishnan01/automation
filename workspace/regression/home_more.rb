#!/usr/bin/env ruby

require 'rubygems'
require 'selenium-webdriver'
require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'

client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 180 # seconds – default is 60

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
# check the tabs for OWN TV
##############################
browser.link(:text, 'More').click;
browser.link(:text, 'Home & Garden').click;
sleep 5;
browser.link(:text, 'More').click;
browser.link(:text, 'Money').click;
sleep 5;
browser.link(:text, 'More').click;
browser.link(:text, 'Exclusives').click;
sleep 5;
browser.link(:text, 'More').click;
browser.link(:text, 'Community').click;
sleep 5;
puts "Test is now complete for More drop down list in Home ".green
f.puts "Test is now complete for More drop down list in Home "
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

