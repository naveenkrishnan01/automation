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
browser.link(:title, "Oprah's Lifeclass").click;

sleep 3;

browser.element(:xpath => ".//*[@id='promo_tab_1']").click;
sleep 2;
browser.element(:xpath => ".//*[@id='promo_tab_2']").click;
sleep 2;
browser.element(:xpath => ".//*[@id='promo_tab_3']").click;
sleep 5;
browser.element(:xpath, ".//*[@id='show_package_wrapper']/div/div[2]/div[1]/div[1]/div[2]/div[1]/div/div/div[2]/a/img").click;
puts "Clicked on Show Your Support link on Oprah's Life Class".blue;
sleep 2;
browser.link(:href, "http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass.html").click;
#sleep 10;
#browser.element(:xpath, ".//*[@id='layout_section_aZAaWMUBejzZHdxSy66nQ']/div[2]/div[1]/div[1]/div[1]/a/img").click;
sleep 2;
puts "Test is now complete for Oprah's life class".green
f.puts "Test is now complete for Oprah's life class"
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
