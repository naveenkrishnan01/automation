#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
#require './checkArg'
require 'date'
require 'json'

configuration = JSON.parse(File.read('./conf.json'))
url = configuration ["url"]

f = File.open('output.txt', 'a')
puts "open the file"

puts "Starting Time now #{Time.now}".cyan
f.puts "Starting Time now #{Time.now}"
  
browser = Watir::Browser.new 

browser.goto "#{url}";
browser.cookies.clear

begin
###############################
# check the links for Oprah next chapter
##############################
browser.link(:href, 'http://www.oprah.com/oprahsnextchapter').click;

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
