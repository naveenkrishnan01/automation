#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'

puts "Starting Time now #{Time.now}".cyan
  
browser = Watir::Browser.new 

browser.goto 'www.oprah.com';
browser.cookies.clear

#f = File.open('output.txt', 'w')
#f.puts "open the file"

#begin
###############################
# check the tabs for OWN TV
##############################
browser.link(:href, 'http://myown.oprah.com/register.html').click;

#*****************************
# Randomization 
#*****************************
fnames = ["Bob", "Robert", "Danny", "Diane", "Lucy"]
lnames = ["Jenna", "Logan", "Morris", "Jeff", "Boris"]
username = ["nkggggg", "nktttt", "nkrrrrr", "nklllll"]
fnamesa = fnames[rand(fnames.length)]
lnamesa = lnames[rand(lnames.length)]
usernamea = username[rand(username.length)]
day = Random.new.rand(10..30)
month = Random.new.rand(1..9)
email = fnamesa + "." + lnamesa + Date.today.to_s + "@example.com"
#usernameb = usernamea + Date.today.to_s


#****************************
# Set field names in the form
#*****************************
browser.text_field(:name, "email_address").set(email);
browser.text_field(:name, "username").set(usernamea);
browser.text_field(:name, "firstname").set(fnamesa);
browser.text_field(:name, "lastname").set(lnamesa);
browser.text_field(:name, "password").set("tommy12");
browser.text_field(:name, "password_confirm").set("tommy12");
sleep 3;
browser.select_list(:name, "birth_month").select(month);
browser.select_list(:name, "birth_dayofmonth").select(day);
browser.select_list(:name, "birth_year").select("1980");
browser.image(:id => 'agree_checkbox', :src => 'https://myown.oprah.com/images/registration/100901/checkbox_off.png').click;
browser.div(:class => 'btn_joinnow_ocom float', :id => 'submit_reg_btn').click;

#rescue Exception => e
#  puts "Error nessage :"
#  puts e
# browser.close
#end
