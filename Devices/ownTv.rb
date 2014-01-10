#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'
require 'webdriver-user-agent'
require './device_type.rb'
require './deviceable.rb'

class OwnTv_device < Device_type
include Deviceable # Mixins for modules
end

m =  OwnTv_device.new
m.check_arg(@name)  # Do not delete this 
driver = m.device(@name1)

configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]

f = File.open('device_output.txt', 'a')
puts "open the file"

puts "Starting Time now #{Time.now}".cyan
f.puts "Starting Time now #{Time.now}"

puts driver.execute_script('return navigator.userAgent')
f.puts "The useragent device is: " + driver.execute_script('return navigator.userAgent')

browser = Watir::Browser.new driver
browser.cookies.clear
browser.goto "#{url}"

sleep 3;

begin
t = Time.now()
s = "20" + t.strftime("%y-%m-%d")
###############################
# check the tabs for OWN TV
##############################
browser.link(:text, 'OWN TV').click

sleep 3;
browser.link(:text, 'Full Episodes').click

sleep 3;
browser.link(:text, 'Videos').click

sleep 3;
browser.link(:text, 'Shows').click

sleep 3;
browser.link(:text, 'Schedule').click

sleep 3;
browser.link(:text, 'Casting Call').click

sleep 3;

puts "Test is now complete for OWNTV".green
f.puts "Test is now complete for OWNTV"
puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
f.puts ' '
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

