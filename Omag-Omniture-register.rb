#!/usr/bin/env ruby

require 'rubygems'
require 'pry'
require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'
require '../browse_env_check.rb'
require './clicks.rb'
require '../date_time.rb'

class OmagSkip < Url_check
  include BrowseEnvCheckable
  include DateTimeable   
end

m = OmagSkip.new
x = m.browsecheck(@browser)
y = m.EnvCheck(@env)
click_count = 0
date_obj = OmagSkip.new

configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]

file = m.ReadFile('output1.txt')

f = File.open("#{file}", 'a')

#binding.pry
puts "open the file"

puts "Starting Time now #{date_obj.dt}".cyan
f.puts "Starting Time now #{date_obj.dt}"


browser = m.browseEnv(@name)

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
###############################
# check the tabs for OWN TV
##############################
if y == '' || y == 'livestg' || y == 'prod'
browser.link(:href, 'http://www.oprah.com/omagazine.html').click;
@t = m.url_check_pt("http://www.oprah.com/omagazine.html")
f.puts "The http://www.oprah.com/omagazine.html was clicked"
click_count += 1
sleep 5;
browser.link(:href, 'http://myown.oprah.com/register.html').click;
@t = m.url_check_pt("http://www.oprah.com/register.html")
f.puts "The http://www.oprah.com/register.html was clicked"
click_count += 1
else
browser.link(:href, 'http://betastg.oprah.com/omagazine.html').click;
@t = m.url_check_pt("http://betastg.oprah.com/omagazine.html")
click_count += 1
f.puts "The http://betastg.oprah.com/omagazine.html was clicked"
sleep 5;
#browser.link(:href, 'http://betamyown.oprah.com/register.html').fire_event('onclick');	
browser.goto  "http://betamyown.oprah.com/register.html"
sleep 5;
@t = m.url_check_pt("http://betamyown.oprah.com/omagazine.html")
click_count += 1
f.puts "The http://betamyown.oprah.com/omagazine.html was clicked"
end

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
# Set field names in the form and submit
#*****************************
browser.text_field(:name, "email_address").set(email);
browser.text_field(:name, "username").set(username);
browser.text_field(:name, "password").set("jackie12");
browser.text_field(:name, "password_confirm").set("jackie12");
sleep 3;
browser.select_list(:name, "birth_month").select(month);
browser.select_list(:name, "birth_dayofmonth").select(day);
browser.select_list(:name, "birth_year").select("1980");
sleep 2;
browser.div(:id => 'agree_checkbox', :class => 'checkbox_icon').click;
sleep 3;
browser.element(:xpath => ".//*[@id='submit_reg_btn']").click;
if browser.element(:xpath => ".//*[@id='submit_reg_btn']").exists?
    puts " Join now button clicked on the Ocom Registration page which navigates to News letter page".green
    f.puts "Join now button clicked on the Ocom Registration page which navigates to News letter page"
else
    f.puts "Issue with the Join now button for Ocom Registration page "
end

#*************************
# click the news letter page and submit
##*************************
sleep 5;
puts "**** This is the variables that was tracked for Omagazine Newsletter page after logging in - #{y} environment ******"
f.puts "**** This is the variables that was tracked for Omagazine Newsletter page after logging in -#{y} environment ******"
f.puts "****************************************"
puts "evar14   :" + browser.execute_script('return s.eVar14') + "  " +  "(Entity-id)";
f.puts "evar10 :" + browser.execute_script('return s.eVar14') + "  " + "(Entity_id)";
puts "evar5    :" + browser.execute_script('return s.eVar5');
f.puts "evar5  :" + browser.execute_script('return s.eVar5');
puts "prop1    :" + browser.execute_script('return s.prop1');
f.puts "prop1  :" + browser.execute_script('return s.prop1');
puts "prop2    :" + browser.execute_script('return s.prop2');
f.puts "prop2  :" + browser.execute_script('return s.prop2');
puts "prop40   :" + browser.execute_script('return s.prop40');
f.puts "prop40 :" + browser.execute_script('return s.prop40');
puts "prop41   :" + browser.execute_script('return s.prop41');
f.puts "prop41 :" + browser.execute_script('return s.prop41');
puts "The total number of urls clicked  for this test is #{click_count}";
f.puts "The total number of urls clicked  for this test is #{click_count}";
f.puts "****************************************"
puts "Test now complete for Omniture tracking for Omag Newsletter page".green
f.puts "Test now complete for Omniture tracking for Omag Newsletter page"

puts "End Time now #{date_obj.dt}".cyan
f.puts "End Time now #{date_obj.dt}"
f.puts ' '
f.close
browser.close

rescue Exception => e
  puts "Error nessage :"
  f.puts "Error nessage :"
  puts e
  puts 'problem with form submission for Owners checked for omniture tracking for Omag Newsletter page' 
  f.puts 'problem with form submission for Omag Subscription for omniture tracking for Omag Newsletter page'
  f.puts ' ' 
 browser.close
 f.close
end
