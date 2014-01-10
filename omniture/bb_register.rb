#!/usr/bin/env ruby

require 'rubygems'
require 'pry'
require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'
require './browse_env_check.rb'
require './clicks.rb'
require './date_time.rb'

class OmagSkip < Url_check
   include BrowseEnvCheckable	
   include DateTimeable
end

date_obj = OmagSkip.new
m = OmagSkip.new
x = m.browsecheck(@browser)
y = m.EnvCheck(@env)
click_count = 0

configuration = JSON.parse(File.read('./conf.json'))
brene = configuration ["Brene"]

file = m.ReadFile('output1.txt')

f = File.open("#{file}", 'a')

#binding.pry
puts "open the file"

puts "Starting Time now #{date_obj.dt}".cyan
f.puts "Starting Time now #{date_obj.dt}"


browser = m.browseEnv(@name)

if y == 'betastg'
browser.goto 'http://ownaccess:oprah@blah'
browser.goto 'http://ownaccess:oprah@blah'
browser.goto 'http://ownaccess:oprah@blah'
browser.goto 'http://ownaccess:oprah@blah'
sleep 1;
browser.goto 'http://betastg.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-landing.html'
 begin
 rescue Timeout::Error => e
end
 elsif y == 'livestg'
 browser.cookies.clear
 browser.goto 'http://myown.oprah.com/blah'
 browser.text_field(:id => 'check_staging').set('1')
 browser.button(:class => 'btn btn-primary').click;
sleep 3;
 browser.goto "#{brene}";
else
 browser.goto "#{brene}"
 browser.cookies.clear
end
sleep 3;


begin
###############################
# check the tabs for OWN TV
##############################
if y == '' || y == 'livestg' || y == 'prod'
 browser.link(:href, 'http://www.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-online-course.html').click; #signin - xpath
 @t = m.url_check_pt("http://www.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-landing.html")
 f.puts "The http://www.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-landing.html was clicked"
 click_count += 1
 sleep 5;
 @t = m.url_check_pt("https://www.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-online-course.html?LoginRegister_action=1&visited_market_landing=1")
 f.puts "The https://www.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-online-course.html?LoginRegister_action=1&visited_market_landing=1 was clicked"
 click_count += 1
else
 browser.element(:xpath, "html/body/div[4]/div[2]/div/ul[2]/li[3]/div[2]/a").click; #signin - xpath
 @t = m.url_check_pt("http://betastg.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-landing.html")
 f.puts "The http://betastg.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-landing.html was clicked"
 click_count += 1
 sleep 5;
 @t = m.url_check_pt("https://betastg.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-online-course.html?LoginRegister_action=1&visited_market_landing=1")
 f.puts "The https://betastg.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-online-course.html?LoginRegister_action=1&visited_market_landing=1 was clicked"
 click_count += 1
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
if y == '' || y == 'livestg' || y == 'prod'
temail = 'naveenkris009@yahoo.com'
else
temail = 'nkbstg@example.com'
end
browser.text_field(:name, "login_email_username").set(temail);
browser.text_field(:name, "login_password").set("hello123");
sleep 3;
if y == '' || y == 'livestg' || y == 'prod'
browser.element(:xpath => "html/body/div[3]/div/div[2]/div/div/div[1]/div[1]/form/div/div[3]/div/input[1]").click;
else
browser.element(:xpath => "html/body/div[2]/div/div[2]/div/div/div[1]/div[1]/form/div/div[3]/div/input[1]").click;
end	
    puts " Sign-in button clicked on the  registration page for Brene Brown".green
    f.puts "Sign-in button clicked on the  registration page for Brene Brown page"
    f.puts "Issue with the Sign-in button  registration for Brene Brown  page "

if y == '' || y == 'livestg' || y == 'prod'
browser.link(:href, "http://www.oprah.com/own-brene-brown-course/brene-course-faq.html").click
 @t = m.url_check_pt("https://www.oprah.com/own-brene-brown-course/bren-course-faq.html")
 f.puts "The https://www.oprah.com/own-brene-brown-course/brene-course-faq.html" 
else
browser.link(:href, "http://betastg.oprah.com/own-brene-brown-course/brene-course-faq.html").click
 @t = m.url_check_pt("https://betastg.oprah.com/own-brene-brown-course/bren-course-faq.html")
 f.puts "The https://betastg.oprah.com/own-brene-brown-course/brene-course-faq.html" 
end
click_count +=1

#*************************
# click the news letter page and submit
##*************************
sleep 5;
puts "**** This is the variables that was tracked for Brene Brown page after logging in - #{y} environment ******"
f.puts "**** This is the variables that was tracked for Brene Brown  page after logging in as new member -#{y} environment ******"
f.puts "************************************"
puts "evar14   :" + browser.execute_script('return s.eVar14') + "  " + "(Entity_Id)";
f.puts "evar14 :" + browser.execute_script('return s.eVar14') + "  " + "(Entity_Id)";
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
#puts "prop46   :" + browser.execute_script('return s.prop46');
#f.puts "prop46 :" + browser.execute_script('return s.prop46');
puts "The total number of urls clicked  for this test is #{click_count}";
f.puts "The total number of urls clicked  for this test is #{click_count}";
f.puts "************************************"
puts "Test now complete for Omniture tracking for Brene Brown registration page for new members".green
f.puts "Test now complete for Omniture tracking for Brene Brown registration page for new members"

puts "End Time now #{date_obj.dt}".cyan
f.puts "End Time now #{date_obj.dt}"
f.puts ' '
f.close
browser.close

rescue Exception => e
  puts "Error nessage :"
  f.puts "Error nessage :"
  puts e
  puts 'problem with form submission for Omniture tracking for Brene Brown registration page for new members' 
  f.puts 'problem with form submission for Omniture tracking for Brene Brown regisration page for new members'
  f.puts ' ' 
 browser.close
 f.close
end
