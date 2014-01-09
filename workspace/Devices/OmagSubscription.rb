#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'
require 'webdriver-user-agent'
require './device_type.rb'

class OmagSubscription_device < Device_type
end

m= OmagSubscription_device.new
m.check_arg(@name)  # Do not delete this 


configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]
#file1 = "#{m.name}" + ".txt"

#f = File.open("#{file1}", 'a')
f = File.open('device_output.txt', 'a')
puts "open the file"


puts "Starting Time now #{Time.now}".cyan
f.puts "Starting Time now #{Time.now}"

if m.name == 'ipad'
	  driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :ipad, :orientation => :landscape)
elsif m.name == 'iphone'
	  driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :iphone, :orientation => :landscape)
elsif m.name == 'android_phone'
	  driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :android_phone, :orientation => :landscape)
elsif m.name == 'android_tablet'
	  driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :android_tablet, :orientation => :landscape)
else
	 driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :android_phone, :orientation => :landscape)
	   end
puts driver.execute_script('return navigator.userAgent')
f.puts "The useragent device is: " + driver.execute_script('return navigator.userAgent')

browser = Watir::Browser.new driver
browser.cookies.clear
browser.goto "#{url}"
sleep 3;

begin
###############################
# check the tabs for OWN TV
##############################
browser.link(:href, 'http://www.oprah.com/omagazine.html').click
sleep 2;
browser.link(:href, 'http://myown.oprah.com/register.html').click
#*****************************
# Randomization 
#*****************************
o = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
username = (0...15).map{ o[rand(o.length)] }.join
day = Random.new.rand(10..30)
month = Random.new.rand(1..9)
email = username + Date.today.to_s + "@example.com"
#usernameb = usernamea + Date.today.to_s

sleep 3;
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
sleep 2;

browser.button(:id => 'finish_btn', :class => 'ocom_button_dark').click;
sleep 3;
#****************************
# click the account settings and manage_news_letter to validate
#*******************************
#if y == 'betastg' || y == 'livestg'
 browser.element(:xpath=> ".//*[@id='username']/a").click
 sleep 3
#end

browser.link(:text, "Account Settings").click;
sleep 2;
browser.div(:id => 'newsletter_panel_switch_container').click;
sleep 5;

puts "Test now complete for Omag Subscription with New Ocom account and nothing checked".green
f.puts "Test now complete for Omag Subscription with New Ocom account and nothing checked"

puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
f.puts ' '
#puts "#{email}";

browser.close

rescue Exception => e
  puts "Error nessage :"
  f.puts "Error nessage :"
  puts e
  puts 'problem with form submission on Omag subscription' 
  f.puts 'problem with form submission on Omag subscription'
  f.puts ' ' 
  browser.close
end
