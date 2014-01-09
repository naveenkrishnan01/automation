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
  
browser = Watir::Browser.new 

browser.goto "#{url}";
browser.cookies.clear


begin
###############################
# check the tabs for Spirit, Health
##############################
browser.goto 'http://www.oprah.com/packages/spring-fashion.html';
puts "Pacakage for spring-fashion link is tested".blue
sleep 2;
#browser.link(:text, 'Your Ultimate Swimsuit Guide').click;
#sleep 2;

browser.goto 'http://www.oprah.com/packages/express-yourself.html';
browser.link(:text, 'Show Us Your Creativity').click;
puts "The page redirects to oprah.com"
f.puts "The page redirects to oprah.com"
sleep 2;

browser.goto 'http://www.oprah.com/packages/express-yourself.html';
browser.link(:text, 'The Power of Poetry').click;
puts "The page redirects to oprah.comi for Power of Poetry".blue 
f.puts "The page redirects to oprah.comi for Power of Poetry"
sleep 2;
puts "Test is now complete for Package Check".green
f.puts "Test is now complete for Package Check"
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








