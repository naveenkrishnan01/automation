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

browser.goto "#{url}";
browser.cookies.clear

#f = File.open('output.txt', 'w')
#f.puts "open the file"

begin
###############################
# check the tabs for OWN TV
##############################
browser.link(:href, 'http://www.oprah.com/omagazine.html').click;
sleep 2;
browser.link(:href, 'http://myown.oprah.com/register.html').click;

#*****************************
# Randomization 
#*****************************
o = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
username = (0...6).map{ o[rand(o.length)] }.join
day = Random.new.rand(10..30)
month = Random.new.rand(1..9)
email = username + Date.today.to_s + "@example.com"
#usernameb = usernamea + Date.today.to_s


#****************************
# Set field names in the form
#*****************************
browser.text_field(:name, "email_address").set(email);
browser.text_field(:name, "username").set(username);
browser.text_field(:name, "password").set("jackie12");
browser.text_field(:name, "password_confirm").set("jackie12");
sleep 3;
browser.select_list(:name, "birth_month").select(month);
browser.select_list(:name, "birth_dayofmonth").select(day);
browser.select_list(:name, "birth_year").select("1980");
browser.div(:id => 'agree_checkbox', :class => 'checkbox_icon').click;
browser.div(:class => 'btn_joinnow_ocom float', :id => 'submit_reg_btn').click;

browser.link(:href => "http://myown.oprah.com/logout.html");
sleep 10;
#*************************
# click the news letter page and submit
#**************************

browser.div(:xpath => ".//*[@id='chk_73']").click;
browser.button(:id => 'finish_btn', :class => 'ocom_button_dark').click;

#****************************
# click the account settings and manage_news_letter to validate
#*******************************

browser.link(:text, "Account Settings").click;
browser.div(:id => 'newsletter_panel_switch_container').click;


puts "Test now complete for Omag Subscription with News Letter checked".green

puts "End Time now #{Time.now}".cyan
#puts "#{email}";

browser.close

rescue Exception => e
  puts "Error nessage :"
  puts e
  puts 'problem with form submission on Omag subscription' 
  browser.close
end
