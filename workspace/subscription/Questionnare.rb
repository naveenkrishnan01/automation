#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
#require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'

client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 500 # 

configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]

puts "Starting Time now #{Time.now}".cyan
  
browser = Watir::Browser.new 

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
browser.link(:href, 'http://www.oprah.com/packages/video-page.html').click
sleep 5;
browser.div(:class => 'rr_cta', :text => 'Submit your story').click
sleep 5;
#******************************************************************
# Set field names in the form --examples of how to use javascript 
#******************************************************************
browser.text_field(:name, "login_email_username").set("naveenkris009@yahoo.com");
browser.text_field(:id => "login_password_text", :class => "reg_input_field input_default_text").clear;

#if browser.text_field(:id => "login_password_text", :class => "reg_input_field input_default_text").fire_event("Onfocus")
#browser.execute_script("document.getElementById('login_password_text').style.display='none';")
#browser.execute_script("document.getElementById('login_password_text').type='password';")
#browser.text_field(:id => "login_password_text", :class => "reg_input_field input_default_text").fire_event("Onfocus")
#browser.execute_script("document.getElementById('login_password_text').style.visibility='visible';")
#browser.execute_script("document.getElementById('login_password_text').value='';")
browser.execute_script("document.getElementById('login_password').value='hello123';")
#end
#**************************
# Click on the Submit button
# **************************
sleep 2;
browser.div(:id => "owners_submit_login_btn").click;
sleep 3;
#**********************************************************************************
# Click on the text below to navigate to Comment page and validatde the submit button
#********************************************************************************** 
browser.div(:class => 'rr_cta', :text => 'Submit your story').click;

t = browser.div(:class => 'frm_submit_btn float')
 if t.exists?
   puts " The Submit button on COMMENT PAGE exists ".green
 else
  puts " There is Problem with Submit button on COMMENT PAGE ".red
end   

sleep 5;

browser.link(:text => 'OPRAH.COM').click;
sleep 2;
m = browser.link(:href => "http://myown.oprah.com/logout.html");
 if m.exists?
  puts "Signed out from the Existing Ocom account".green
  m.click
 else
  puts " Did not Sign out from the account"
end   

puts "Test now complete for Qestionnare ".green

puts "End Time now #{Time.now}".cyan

browser.close

rescue Exception => e
  puts "Error nessage :"
  puts e
  puts 'problem with form submission on Omag subscription' 
  browser.close
end
