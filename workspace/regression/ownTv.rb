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
# check the tabs for OWN TV
##############################
browser.link(:text, 'OWN TV').click;
sleep 3;
browser.link(:text, 'Full Episodes').click;
sleep 3;
browser.link(:text, 'Videos').click;
sleep 3;
browser.link(:text, 'Shows').click;
sleep 3;
browser.link(:text, 'Schedule').click;
sleep 3;
browser.link(:text, 'Casting Call').click;
sleep 3;
puts "Test is now complete for OWNTV".green
f.puts "Test is now complete for OWNTV"
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

