#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
#require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'

client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 180 # 

configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]

puts "Starting Time now #{Time.now}".cyan
  
browser = Watir::Browser.new :chrome 

browser.goto "#{url}";
browser.cookies.clear

#f = File.open('output.txt', 'w')
#f.puts "open the file"

begin
sleep 2;	
###############################
# Click Owners Exclusive
##############################
browser.element(:xpath, ".//*[@id='left_col_large_image_promo_content']/div[2]/div[1]/a/img").click
sleep 5;		
#****************************
# Set field names in the form
#*****************************
browser.text_field(:name, "login_email_username").set("naveenkris009@yahoo.com");
browser.text_field(:id => "login_password_text", :class => "reg_input_field input_default_text").fire_event("onBlur");
sleep 5;

#browser.text_field(:id => "login_password_text", :class => "reg_input_field input_default_text").fire_event("onSelect");
browser.text_field(:id => "login_password_text", :class => "reg_input_field input_default_text").click;
sleep 6;
browser.text_field(:id => "login_password_text", :class => "reg_input_field input_default_text").fire_event("onSelect");
#browser.text_field(:id => "login_password_text", :class => "reg_input_field input_default_text").set("hello123");
browser.text_field(:name => "login_password_text", :class => "reg_input_field input_default_text").set("hello123");
browser.div(:id => "owners_submit_login_btn").click;
sleep 3;

#*************************
# click the news letter page and submit
#**************************


#****************************
# click the account settings and manage_news_letter to validate
#*******************************



puts "Test now complete for Qestionnare ".green

puts "End Time now #{Time.now}".cyan
#puts "#{email}";

#browser.close

#rescue Exception => e
#  puts "Error nessage :"
#  puts e
#  puts 'problem with form submission on Omag subscription' 
#  browser.close
end
