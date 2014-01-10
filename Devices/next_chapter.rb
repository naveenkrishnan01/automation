#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
#require './checkArg'
require 'date'
require 'json'
require 'webdriver-user-agent'
require './device_type.rb'
require './deviceable.rb'

class NextChapter_device < Device_type
include Deviceable # Mixins for modules
end

n = NextChapter_device.new
n.check_arg(@name)  # Do not delete this 
driver = n.device(@name1)

configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]
#file1 = "#{n.name}" + ".txt"

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

sleep 3;

begin
###############################
# check the links for Oprah next chapter
##############################
browser.link(:href, 'http://www.oprah.com/oprahsnextchapter').click
sleep 3;
browser.element(:xpath, ".//*[@id='promo_tab_1']").click;
sleep 2;
browser.element(:xpath, ".//*[@id='promo_tab_2']").click;
sleep 2;
browser.element(:xpath, ".//*[@id='promo_tab_3']").click;
sleep 2;
browser.link(:xpath, ".//*[@id='show_package_wrapper']/div/div[1]/div[1]/div[2]/div[2]/div/div/div[3]/a").click;
sleep 2;
browser.link(:href, 'http://www.oprah.com/own-oprahs-next-chapter/oprahs-next-chapter.html').click;
sleep 2;
#browser.link(:xpath, ".//*[@id='layout_section_vEmmyydXWVPPtS5c0s8Awg']/div[2]/div[2]/div[1]/div[2]/a").click;
#sleep 3;
puts "Test is now complete for next chapter".green
f.puts "Test is now complete for next chapter"
puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
f.puts ' '
browser.close
f.close

rescue Exception => e
  puts "Error message :Problem with the next Chapter site"
  f.puts "Error message :Problem with the next Chapter site"
  puts e
  f.puts e
  f.puts ' '
browser.close
f.close
end  
