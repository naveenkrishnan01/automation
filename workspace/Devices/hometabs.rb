#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'
require 'webdriver-user-agent'
require './device_type.rb'

class Hometabs_device < Device_type
end

m = Hometabs_device.new
m.check_arg(@name)  # Do not delete this 


configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]
#file1 = "#{m.name}" + ".txt"


#f = File.open("#{file1}", 'a')
f = File.open('device_output.txt', 'a')
puts "open the file"


puts "Starting Time now #{Time.now}".cyan
f.puts "Starting Time now #{Time.now}"

if m.name == 'ipad'
	  driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :ipad, :orientation => :landscape)
elsif m.name == 'iphone'
	  driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :iphone, :orientation => :landscape)
elsif m.name == 'android_phone'
	  driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :android_phone, :orientation => :landscape)
elsif m.name == 'android_tablet'
	  driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :android_tablet, :orientation => :landscape)
else
	 driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :android_phone, :orientation => :landscape)
	   end

puts driver.execute_script('return navigator.userAgent')
f.puts "The useragent device is: " + driver.execute_script('return navigator.userAgent')

browser = Watir::Browser.new driver
browser.cookies.clear
browser.goto "#{url}"

sleep 2;
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
f.puts ' '
browser.close
f.close

rescue Exception => e
  puts "Error message : Please check the tabs on the Home Page"
  f.puts "Error message : Please check the tabs on the Home Page"
  puts e
  f.puts e
  f.puts ' '
browser.close
f.close
end








