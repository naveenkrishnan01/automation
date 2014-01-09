#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'
require 'webdriver-user-agent'
require './device_type.rb'

class Package_device < Device_type
end

m = Package_device.new
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
puts "The page redirects to oprah.com for Power of Poetry".blue 
f.puts "The page redirects to oprah.com for Power of Poetry"
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








