#!/usr/bin/env ruby

require 'rubygems'

require 'colorize'
require 'date'
require 'json'
require 'safariwatir'

puts "Starting Time now #{Time.now}".cyan
  
browser = Watir::Safari.new
#browser.cookies.clear

browser.goto 'http://www.oprah.com'

sleep 2;
#begin
###############################
# check the tabs for OWN TV and navigate back to Home page
##############################
browser.goto 'http://www.oprah.com/own-the-customer-is-always-right/Deleted-Scenes-Will-These-2-Opposite-Customers-Attract-Video'
sleep 2;
browser.back;
#browser.elements_by_xpath(".//*[@id='triptypch_container']/div[3]/a[1]/img").click;
#sleep 2;
#browser.back;
#browser.elements_by_xpath(".//*[@id='triptypch_container']/div[3]/a[2]/img").click;
#sleep 2;
#browser.back;
puts " Test is now complete for carousal on home page".cyan

puts "End Time now #{Time.now}".cyan
browser.close

#rescue Exception => e
#  puts "Error nessage :"
#  puts e
 # puts 'problem with form submission'
 # browser.close
#end
