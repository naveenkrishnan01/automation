#!/usr/bin/env ruby
require 'pry'
require 'rubygems'
require 'date'
require 'colorize'
require 'watir-webdriver'
require 'webdriver-user-agent'
require './device_type.rb'
require './browserable.rb'

class Carousal_device < Device_type
include Deviceable #Mixins for modules  
end

m = Carousal_device.new
m.check_arg(@name)  # Do not delete this 
puts m.name
driver = m.device(@name1)


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







