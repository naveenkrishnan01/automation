#!/usr/bin/env ruby

require 'rubygems'
require 'selenium-webdriver'
require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'
require 'webdriver-user-agent'
require './device_type.rb'
require './browse-env.rb'

class Omagazine_device < Device_type
end

m = Omagazine_device.new
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
# check the links for Oprah next chapter
##############################
browser.link(:text, "O Magazine").click;
sleep 3;
browser.image(:id, 'popular_image').click;
puts 'Featured link successful'.green
f.puts 'Featured link successful'
sleep 3;
browser.image(:id, 'see_all_image').click;
puts 'Newest link successful'.green
f.puts 'Newest link successful'
sleep 5;
browser.span(:text, 'NEXT').fire_event("onclick");
puts "Page 2 pagination done".green
f.puts "Page 2 pagination done";
#sleep 3;
 
sleep 3;
puts "Test is now complete for o_magazine".green
f.puts "Test is now complete for o_magazine"
puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
f.puts ' '
browser.close
f.close

rescue Exception => e
  puts "Error message :Problem with O_magazine page"
  f.puts "Error message :Problem with O_magazine page"
  puts e
  f.puts e
  f.puts ' '
  f.close
browser.close
end
