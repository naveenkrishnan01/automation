#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'
require '../browse-env.rb'
require '../date_time.rb'

class NewFb < BrowseEnv
  include DateTimeable
end	

@browser1 = ARGV[0]
@env = ARGV[1]

date_obj = NewFb.new
x = init(@browser1)
y = environment(@env)

configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]

f = File.open('output1.txt', 'a')
puts "open the file"

puts "Starting Time now #{date_obj.dt}".cyan
f.puts "Starting Time now #{date_obj.dt}"
 if x == 'chrome'
   browser = Watir::Browser.new :chrome
 elsif
    x == 'ff'
    browser = Watir::Browser.new
  else
    browser = Watir::Browser.new
  end
  if y == 'betastg'
     browser.goto 'http://ownaccess:oprah@betamyown.oprah.com/dump.html'
     browser.goto 'http://ownaccess:oprah@betastg.oprah.com/index.html'

 begin
   rescue Timeout::Error => e
  end
   elsif y == 'livestg'
     browser.cookies.clear
     browser.goto 'http://myown.oprah.com/cookieMgr.html'
     browser.text_field(:id => 'check_staging').set('1')
     browser.button(:class => 'btn btn-primary').click;
sleep 3;
     browser.goto "#{url}";
    else
    browser.goto "#{url}"
    browser.cookies.clear
  end
  sleep 3;


begin
#**********************************************
# log into admin tool and create new FB account
#**********************************************
if y == 'betastg'
  browser.goto "http://betamyown.oprah.com/admintool/"
else
  browser.goto "admin.oprah.com"
end
sleep 2;
browser.link(:text, "Facebook Test Users").click;
sleep 3;
if y == 'betastg'
   browser.text_field(:name, "login_email_username").set("nkbstg@example.com");
   browser.text_field(:name, "login_password").set("hello123");
else
   browser.text_field(:name, "login_email_username").set("naveenkris009@yahoo.com");
   browser.text_field(:name, "login_password").set("hello123");
end
puts "Clicked on Facebook Test user on the admin tool".green
f.puts "Clicked on Facebook Test user on the admin tool"

sleep 2;
if y == 'betastg'
browser.button(:src, "http://static.oprah.com/css/ocom/globalassets/btn_SignIn.png").click;
else
browser.button(:src, "https://securestatic.oprah.com/css/ocom/globalassets/btn_SignIn.png").click;
end
sleep 2;
browser.button(:value, "Create User").click;
sleep 5;
email1 = browser.div(:id, "user_created").span(:class, "email").text
pass1 = browser.div(:id, "user_created").span(:class, "password").text
puts "#{email1}";
puts "#{pass1}";
puts "Email and Password generated thru admin tool by clicking Create User".green
f.puts "Email and Password generated thru admin tool by clicking Create User"
sleep 8;

if y == 'livestg'
browser.button(:class, "btn btn-primary").click
else
browser.div(:class, "ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix").span(:class, "ui-icon ui-icon-closethick").click;
end

sleep 5;
if y == 'betastg'
browser.link(:href, "http://betamyown.oprah.com/logout.html").click
else
browser.link(:href, "http://myown.oprah.com/logout.html").click;
end

browser.goto "https://www.facebook.com/"
sleep 3;
browser.text_field(:id, "email").set(email1)
browser.text_field(:id, "pass").set(pass1)
if x == 'chrome'
browser.button(:type, "submit").fire_event("onclick")
else       	       
browser.button(:type, "submit").click
end
puts " Log into Facebook and enter Email and password that was generated from admin tool"
f.puts " Log into Facebook and enter Email and password that was generated from admin tool"

sleep 3;
if y == 'livestg'
# browser.cookies.clear
 browser.goto 'http://myown.oprah.com/cookieMgr.html'
 browser.text_field(:id => 'check_staging').set('1')
 browser.button(:class => 'btn btn-primary').click;
 sleep 3;
 browser.goto "#{url}";
else 
 browser.goto "#{url}";
 browser.cookies.clear
end
#f = File.open('output.txt', 'w')
#f.puts "open the file"

#begin
###############################
# check the tabs for OWN TV
##############################
if y == '' || y == 'livestg' || y == 'prod'
   browser.link(:href, 'http://www.oprah.com/omagazine.html').click;
   sleep 2;
   browser.link(:href, 'http://myown.oprah.com/register.html').click;
   sleep 3;
else
   browser.link(:href, 'http://betastg.oprah.com/omagazine.html').click;
   sleep 5;
   browser.goto  "http://betamyown.oprah.com/register.html"
   sleep 5;
end

browser.img(:id, 'facebook_register_btn').click;
sleep 3;
browser.window(:title => "Log in with Facebook").use do
   browser.button(:text => "Okay").click;
end
puts "Connect with Facebook clicked on the registration page".green
f.puts "Connect with Facebook clicked on the registration page"
sleep 6;
#*************************
# click the news letter page and submit
#**************************
browser.button(:id => 'finish_btn', :class => 'ocom_button_dark').click;
sleep 3;
browser.link(:xpath, ".//*[@id='username']/a").click
sleep 4;
#****************************
# click the account settings and manage_news_letter to validate
#*******************************

browser.link(:text, "Account Settings").click;
sleep 3;
browser.div(:id => 'newsletter_panel_switch_container').click;
sleep 5;
browser.link(:href => "http://mywon.oprah.com/logout.html");
sleep 5;

browser.goto "https://www.facebook.com/"
sleep 2;
browser.link(:id, "navAccountLink").click
sleep 3;
browser.button(:value, "Log Out").click
puts "Logged out from Facebook account".cyan
f.puts "Logged out from Facebook account"

puts "Test now complete for Omag Subscription for new FaceBook account".green
f.puts "Test now complete for Omag Subscription for new FaceBook account"

puts "End Time now #{date_obj.dt}".cyan
#puts "#{email}";
f.puts "End Time now #{date_obj.dt}"
f.puts ' '
f.close
browser.close

rescue Exception => e
  puts "Error nessage :"
  puts e
  puts 'problem with form submission for new Facebook registration for the finish button'
  f.puts 'problem with form submission for new Facebook registration for the finish button'
  browser.close
  f.puts ' '
  f.close
end
