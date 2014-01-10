#!/usr/bin/env ruby

require 'rubygems'
require 'pry'
require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'
require 'webdriver-user-agent'
require './device_type.rb'
require './deviceable.rb'

class Carousal_device < Device_type
include Deviceable # Mixins for modules
end

m = Carousal_device.new
m.check_arg(@name)  # Do not delete this 
driver = m.device(@name1)

configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]
#file1 = "#{m.name}" + ".txt"
#binding.pry
#f = File.open("#{file1}", 'a')
f = File.open('device_output.txt', 'a')
puts "open the file"


puts "Starting Time now #{Time.now}".cyan
f.puts "Starting Time now #{Time.now}"

puts driver.execute_script('return navigator.userAgent')
f.puts "The useragent device is: " + driver.execute_script('return navigator.userAgent')

browser = Watir::Browser.new driver
browser.cookies.clear
browser.goto "#{url}"

sleep 2;
begin
###############################
# check the tabs for OWN TV and navigate back to Home page
##############################
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
f.puts " Test is now complete for carousal on home page"

puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
f.puts ' '
browser.close
f.close

rescue Exception => e
  puts "Error nessage :"
  f.puts "Error nessage :"
  puts e
  puts 'problem with carousal Page'
  f.puts 'problem with carousal page'
  f.puts ' '
  browser.close
  f.close
end


