#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
#require './checkArg'
require 'date'

puts "Starting Time now #{Time.now}".cyan
  
browser = Watir::Browser.new :chrome 

browser.goto 'www.oprah.com';
browser.cookies.clear

#f = File.open('output.txt', 'w')
#f.puts "open the file"

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

puts "Test is now complete for next chapter".green
puts "End Time now #{Time.now}".cyan
browser.close

rescue Exception => e
  puts "Error message :"
  puts e
browser.close
end  
