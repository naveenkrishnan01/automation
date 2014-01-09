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

#f = File.open('output.txt', 'w')
#f.puts "open the file"

sleep 2;
begin
###############################
# check the tabs for OWN TV
##############################
browser.element(:xpath, ".//*[@id='triptypch_container']/div[3]/a[3]/img").click;
sleep 2;
browser.back;
sleep 2;
browser.element(:xpath, ".//*[@id='triptypch_container']/div[3]/a[1]/img").click;
sleep 2;
browser.back;
sleep 2;
browser.element(:xpath, ".//*[@id='triptypch_container']/div[3]/a[2]/img").click;
sleep 2;
puts " Test is now complete for carousal on home page".green
puts "End Time now #{Time.now}".cyan
browser.close

rescue Exception => e
  puts "Error nessage :"
  puts e
  puts 'problem with Carousel testing'.red
  browser.close
end


