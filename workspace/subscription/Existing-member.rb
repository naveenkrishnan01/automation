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

browser.goto "#{url}"
browser.cookies.clear

#f = File.open('output.txt', 'w')
#f.puts "open the file"

begin
###############################
# Navigate to O-magazine section and click on Join for members
##############################
browser.link(:href, 'http://www.oprah.com/omagazine.html').click;
sleep 2;
browser.link(:href, 'http://myown.oprah.com/register.html').click;

#*****************************
# Randomization 
#*****************************
#username = ["nkggggg", "nktttt", "nkrrrrr", "nklllll"]
o = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
username = (0...6).map{ o[rand(o.length)] }.join
day = Random.new.rand(10..30)
month = Random.new.rand(1..9)
#email = fnamesa + "." + lnamesa + Date.today.to_s + "@example.com"
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

browser.div(:id => 'owner_checkbox', :class => 'checkbox_icon').click;
sleep 2;
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

browser.img(:title => 'SKIP OFFER').click;
sleep 5;
browser.img(:title => "Sign out").click;
sleep 3;
#*****************************
# Go back to O-magazine section
#******************************
browser.link(:href, 'http://www.oprah.com/omagazine.html').click;
sleep 2;
browser.link(:href, 'http://myown.oprah.com/register.html').click;
sleep 2;
browser.text_field(:name, "login_email_username").set(email);
browser.text_field(:name, "login_password").set("jackie12");
sleep 2;
browser.button(:src, "https://securestatic.oprah.com/css/ocom/globalassets/btn_SignIn.png").click;
sleep 2;
browser.link(:text, "Account Settings").click;
sleep 2;
browser.div(:id => 'newsletter_panel_switch_container').click;

puts " Test Now complete for Owners and Newsletter for Exisitng Members".green

puts "End Time now #{Time.now}".cyan

browser.close

rescue Exception => e
  puts "Error nessage :"
  puts e
  puts 'problem with form submission' 
  browser.close
end
