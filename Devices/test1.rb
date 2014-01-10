#!/usr/bin/env ruby
require 'pry'
require 'rubygems'
require 'date'
require 'colorize'
require 'watir-webdriver'
require 'webdriver-user-agent'
require './device_type.rb'

class Carousal_device < Device_type
end

m = Carousal_device.new
m.check_arg(@name)  # Do not delete this 
puts m.name

#binding.pry
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
browser.goto 'www.oprah.com'

browser.element(:xpath, ".//*[@id='triptypch_container']/div[3]/a[3]/img").click;
sleep 3;
browser.back;
browser.element(:xpath, ".//*[@id='triptypch_container']/div[3]/a[1]/img").click;
sleep 3;
browser.back;
browser.element(:xpath, ".//*[@id='triptypch_container']/div[3]/a[2]/img").click;
sleep 3;
browser.back;
puts " Test is now complete for carousal on home page".cyan







