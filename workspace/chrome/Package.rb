#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'


configuration = JSON.parse(File.read('./conf.json'))
url = configuration ["url"]

puts "Starting Time now #{Time.now}".cyan
  
browser = Watir::Browser.new :chrome 

browser.goto "#{url}";
browser.cookies.clear


begin
###############################
# check the tabs for Spirit, Health
##############################
browser.goto 'http://www.oprah.com/packages/spring-fashion.html';
puts "Pacakage for spring-fashion link is tested".green
sleep 2;
browser.link(:text, 'Your Ultimate Swimsuit Guide').click;
sleep 2;

browser.goto 'http://www.oprah.com/packages/express-yourself.html';
browser.link(:text, 'Show Us Your Creativity').click;
puts "The page redirects to oprah.com".green
sleep 2;

browser.goto 'http://www.oprah.com/packages/express-yourself.html';
browser.link(:text, 'The Power of Poetry').click;
puts "The page redirects to oprah.com".green 
sleep 2;
puts "Test is now complete for Package Check".green
puts "End Time now #{Time.now}".cyan
browser.close


rescue Exception => e
  puts "Error message :"
  puts e
browser.close
end








