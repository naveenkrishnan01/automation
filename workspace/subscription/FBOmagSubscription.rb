#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'

configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]

puts "Starting Time now #{Time.now}".cyan
  
browser = Watir::Browser.new 

browser.goto "https://www.facebook.com/"

browser.text_field(:id, "email").set("naveen_krishnan@own.tv")
browser.text_field(:id, "pass").set("Jamesbond007")
browser.button(:type,"submit").click

sleep 5;

browser.goto "#{url}";
browser.cookies.clear

#f = File.open('output.txt', 'w')
#f.puts "open the file"

#begin
###############################
# check the tabs for OWN TV
##############################
browser.link(:href, 'http://www.oprah.com/omagazine.html').click;
sleep 2;
browser.link(:href, 'http://myown.oprah.com/register.html').click;
sleep 3;

browser.img(:id, 'facebook_register_btn').click;
sleep 6;
#*************************
# click the news letter page and submit
#**************************
browser.button(:id => 'finish_btn', :class => 'ocom_button_dark').click;
sleep 3;
browser.link(:text, 'Naveen Krishnan').click
sleep 8;
#****************************
# click the account settings and manage_news_letter to validate
#*******************************

browser.link(:text, "Account Settings").click;
browser.div(:id => 'newsletter_panel_switch_container').click;
sleep 5;
browser.link(:href => "http://mywon.oprah.com/logout.html");
sleep 5;

browser.goto "https://www.facebook.com/"
sleep 2;
browser.link(:id, "navAccountLink").click
sleep 3;
browser.button(:value,"Log Out").click
puts "Logged out from Facebook account".cyan

puts "Test now complete for Omag Subscription for exisitng FaceBook account".green

puts "End Time now #{Time.now}".cyan
#puts "#{email}";

browser.close

#rescue Exception => e
#  puts "Error nessage :"
#  puts e
#  puts 'problem with form submission on Omag subscription' 
#  browser.close
#end
