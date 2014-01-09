#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'
require './browse-env.rb'

configuration = JSON.parse(File.read('./conf.json'))
url1 = configuration ["url1"]

f = File.open('output.txt', 'a')
puts "open the file"

puts "Starting Time now #{Time.now}".cyan
f.puts "Starting Time now #{Time.now}"
  
browser = Watir::Browser.new  

browser.goto "#{url1}";
browser.cookies.clear


begin
###############################
# check the tabs for Spirit, Health
##############################
browser.goto 'wwwsrc.oprah.com/spirit.html';
puts "Spirit tab is tested for Origin Check".blue
f.puts "Spirit tab is tested for Origin Check"
sleep 2;
browser.goto "#{url1}"
sleep 2;
browser.img(:xpath, ".//*[@id='triptypch_container']/div[3]/a[3]/img").click;
puts "featured videos page clicked for Origin Check".blue
f.puts "featured videos page clicked for Origin Check"
sleep 2;
browser.goto 'http://wwwsrc.oprah.com/own-super-soul-sunday/super-soul-sunday.html';
puts "check super soul sunday for Origin Check".blue
f.puts "check super soul sunday for Origin Check"
sleep 2;
browser.goto "#{url1}"

puts "Test is now complete for Origin Check".green
f.puts "Test is now complete for Origin Check"
puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
browser.close
f.close

rescue Exception => e
  puts "Error message :"
  f.puts "Error message :"
  puts e
browser.close
f.close
end








