#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'
#require './browse-env.rb'

browser = Watir::Browser.new 
 
browser.goto 'http://o20-dev.oprah.com/'
sleep 2;	   

f = File.open('own2homepage.txt', 'a')

begin
###############################
# click on the newsletter link
##############################

t = browser.div(:class, "icon-grid")
if t.exists?
  puts "The icon grid exists ".green
  f.puts "The icon grid exists "
 else
  puts "The icon grid does NOT exists".red
  f.puts "The icon grid does NOT exists"
 end

t.click;

sleep 3;

a = browser.img(:src => "http://static.oprah.com/css/OWN_2/global_assets/Nav_icons/icon-owntv-48x48.jpg")
puts a.exists? ?  "Navigate to own tv page".green : "Issue with Navigation to owntv page".red
f.puts a.exists? ?  "Navigate to own tv page" : "Issue with Navigation to owntv page"
a.click;
sleep 5;


b = browser.div(:class => "button ui-draggable")
b.drag_and_drop_by 18, 0
puts b.exists? ?  "Button moved from daily to weekly".green : "Issue with button move from daily to weekly".red
f.puts b.exists? ?  "Button moved from daily to weekly" : "Issue with button move from daily to weekly"
sleep 5;

a = browser.element(:xpath => ".//*[@id='tvschedule']/div[3]/div/div[1]/div[2]/div[3]")
for i in 1..5	
  if i < 5
   a.click
  sleep 2; 
 end  
end
puts "The weekly schedule for Monday was slide from right to left 5 times"
f.puts "The weekly schedule for Monday was slide from right to left 5 times"


m = browser.element(:xpath => ".//*[@id='tvschedule']/div[3]/div/div[1]/div[2]/div[2]")
for i in 1..5	
  if i < 5
   m.click
  sleep 2; 
 end  
end

puts "The weekly schedule for Monday was slide from left to right 5 times"
f.puts "The weekly schedule for Monday was slide from left to right 5 times"
sleep 2;

puts "Test now complete for OWN2 TV".green
f.puts "Test now complete for OWN2 TV"

puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
#browser.close

rescue Exception => e
  puts "Error nessage :"
  puts e
  puts 'problem with print icon on the article page' 
# browser.close
end
