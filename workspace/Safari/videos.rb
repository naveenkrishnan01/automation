#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'

puts "Starting Time now #{Time.now}".cyan
  
browser = Watir::Browser.new 

browser.goto 'www.oprah.com';
browser.cookies.clear


sleep 2;
#begin
###############################
# check the tabs for OWN TV
##############################
browser.link(:title, "Videos").click;
sleep 2;
browser.element(:xpath => ".//*[@id='own_body_wrapper']/div[1]/div/div[2]/div[1]/a/img").click;

sleep 5;

 
 browser.div(:id => "ocom_video_content_wrapper", :class => "media_video").click;
 
 
# if t.exists?
 #  t.click
 #  puts " try clicking it"
 # end

sleep 2;

puts "End Time now #{Time.now}".cyan
#browser.close

#rescue Exception => e
 # puts "Error nessage :"
 # puts e
 # puts 'problem with form submission'
 # browser.close
#end


