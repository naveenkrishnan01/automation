#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'
require 'webdriver-user-agent'
require './device_type.rb'

class HomeMore_device < Device_type
end

m = HomeMore_device.new
m.check_arg(@name)  # Do not delete this 

configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]
#file1 = "#{m.name}" + ".txt"

#f = File.open("#{file1}", 'a')
f = File.open('device_output.txt', 'a')
puts "open the file"

puts "Starting Time now #{Time.now}".cyan
f.puts "Starting Time now #{Time.now}"

## At this point orientation does not make sense because our websites do not rendeder images based on device
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
browser = Watir::Browser.new driver
browser.cookies.clear
browser.goto "#{url}"

sleep 3;
begin
###############################
# check the tabs for OWN TV
##############################
browser.link(:text, 'More').click;
sleep 2;
browser.link(:text, 'Home & Garden').click;
sleep 5;
browser.link(:text, 'More').click;
sleep 2;
browser.link(:text, 'Money').click;
sleep 5;
browser.link(:text, 'More').click;
sleep 2;
browser.link(:text, 'Exclusives').click;
sleep 5;
browser.link(:text, 'More').click;
sleep 2;
browser.link(:text, 'Community').click;
sleep 5;
puts "Test is now complete for More drop down list in Home ".green
f.puts "Test is now complete for More drop down list in Home "
puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
f.puts ' '
#browser.close
f.close

rescue Exception => e
 puts "Error message : Please check the More drop down list in Home"
 f.puts "Error message :Please check the More drop down list in Home "
 puts e
 f.puts ' '
# browser.close
  f.close
end

