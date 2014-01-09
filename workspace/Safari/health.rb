#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'

configuration = JSON.parse(File.read('./conf.json'))
url = configuration ["url"]

puts "Starting Time now #{Time.now}".cyan
  
browser = Watir::Browser.new 

browser.goto "#{url}";
browser.cookies.clear

#f = File.open('output.txt', 'w')
#f.puts "open the file"

begin
###############################
# check the tabs for Spirit, Health
##############################
browser.link(:text, 'Health').click;
sleep 2;
t = browser.div(:class => "homepage_image featured_story1")
 if t.exists?
    puts "Featured Image found for Health and clicked on the feature".green
 else
    puts "Feature Image not found for Health Page".red
 end

browser.element(:xpath => ".//*[@id='ocom_content_wrapper']/div[1]/div[2]/div[1]/a/img").click;
sleep 2;
browser.back;

m = browser.div(:class => "promo_image")
  if m.exists?
   puts "Promo Image found for Health and clicked on the promo".green
  else
    puts "Promo Image not found for Health Page".red
  end

browser.element(:xpath => ".//*[@id='feat_sub_container']/div[1]/div[2]/div[1]/a/img").click;
sleep 2;

browser.back;

l = browser.element(:xpath => ".//*[@id='feed_results']/div[1]/div[2]/div[1]/a/img");
 if l.exists?
  puts "The article feed clicked on the Health page".green
 else
  puts "Article feed not found on Health page".red
 end

l.click; 
sleep 3;

puts "Test is now complete for Health Page".green
puts "End Time now #{Time.now}".cyan
browser.close


rescue Exception => e
  puts "Error message :"
  puts e
browser.close
end








