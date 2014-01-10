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

obj_date = OmagSkip.new
m = OmagSkip.new
x = m.browsecheck(@browser)
y = m.EnvCheck(@env)
click_count = 0

configuration = JSON.parse(File.read('../conf.json'))
brene = configuration ["Brene"]

file = m.ReadFile('output1.txt')

f = File.open("#{file}", 'a')

#binding.pry
puts "open the file"

puts "Starting Time now #{obj_date.dt}".cyan
f.puts "Starting Time now #{obj_date.dt}"


browser = m.browseEnv(@name)

if y == 'betastg'
browser.goto 'http://ownaccess:oprah@betamyown.oprah.com/dump.html'
browser.goto 'http://ownaccess:oprah@betastg.oprah.com/index.html'
browser.goto 'http://ownaccess:oprah@betamyown.oprah.com/dump.html'
browser.goto 'http://ownaccess:oprah@betastg.oprah.com/index.html'
sleep 1;
browser.goto 'http://betastg.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-landing.html'
 begin
 rescue Timeout::Error => e
end
 elsif y == 'livestg'
 browser.cookies.clear
 browser.goto 'http://myown.oprah.com/cookieMgr.html'
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
  browser.link(:href, "http://betastg.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-online-course.html").click; #signin - xpath
 @t = m.url_check_pt("http://betastg.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-landing.html")
 f.puts "The http://betastg.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-landing.html was clicked"
 click_count += 1
 sleep 5;
 @t = m.url_check_pt("https://betastg.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-online-course.html?LoginRegister_action=1&visited_market_landing=1")
 f.puts "The https://betastg.oprah.com/own-brene-brown-course/lifeclass-presents-brene-brown-online-course.html?LoginRegister_action=1&visited_market_landing=1 was clicked"
 click_count += 1
end

sleep 3;
#****************************
# Set field names in the form and submit
#*****************************
if y == '' || y == 'livestg' || y == 'prod'
uemail = "naveenkris009@yahoo.com"
else
uemail = "nkbstg@example.com"
end
browser.text_field(:name, "login_email_username").set(uemail);
browser.text_field(:name, "login_password").set("hello123");
sleep 3;
if y == '' || y == 'livestg' || y == 'prod'
browser.element(:xpath, 'html/body/div[3]/div/div[2]/div/div/div[1]/div[1]/form/div/div[3]/div/input[1]').click;
else
browser.element(:xpath, 'html/body/div[2]/div/div[2]/div/div/div[1]/div[1]/form/div/div[3]/div/input[1]').click;
end
puts " Sign_in and continue button clicked by paid member for Brene Brown".green
  f.puts "Sign_in and continue  button clicked by paid member for Brene Brown page"

#*************************
# click the news letter page and submit
##*************************
sleep 5;
 @t = m.url_check_pt("http://www.oprah.com/package.html?category=brene-brown-course&page_link_url=lifeclass-presents-brene-brown-online-course.html&LoginRegister_action=1&visited_market_landing=1")
f.puts "http://www.oprah.com/package.html?category=brene-brown-course&page_link_url=lifeclass-presents-brene-brown-online-course.html&LoginRegister_action=1&visited_market_landing=1 is where the page is currently located"
click_count += 1
puts "**** This is the variables that was tracked for Brene Brown Course page for paid member -#{y} environment ********"
f.puts "**** This is the variables that was tracked for Brene Brown Course page for paid member -#{y} environment ******"
f.puts "****************************************"
puts "evar20   :" + browser.execute_script('return s.eVar20');
f.puts "evar20 :" + browser.execute_script('return s.eVar20');
puts "evar14   :" + browser.execute_script('return s.eVar14') + "  " + "(Entity_Id)";
f.puts "evar14 :" + browser.execute_script('return s.eVar14') + "  " + "(Entity_Id)";
puts "evar5    :" + browser.execute_script('return s.eVar5');
f.puts "evar5  :" + browser.execute_script('return s.eVar5');
puts "prop1    :" + browser.execute_script('return s.prop1');
f.puts "prop1  :" + browser.execute_script('return s.prop1');
puts "prop2    :" + browser.execute_script('return s.prop2');
f.puts "prop2  :" + browser.execute_script('return s.prop2');
puts "prop4    :" + browser.execute_script('return s.prop4');
f.puts "prop4  :" + browser.execute_script('return s.prop4');
puts "prop5    :" + browser.execute_script('return s.prop5');
f.puts "prop5  :" + browser.execute_script('return s.prop5');
puts "prop6    :" + browser.execute_script('return s.prop6');
f.puts "prop6  :" + browser.execute_script('return s.prop6');
puts "prop40   :" + browser.execute_script('return s.prop40');
f.puts "prop40 :" + browser.execute_script('return s.prop40');
puts "prop41   :" + browser.execute_script('return s.prop41');
f.puts "prop41 :" + browser.execute_script('return s.prop41');
puts "The total number of urls clicked  for this test is #{click_count}";
f.puts "The total number of urls clicked  for this test is #{click_count}";
f.puts "****************************************"
puts "Test now complete for Omniture tracking for Brene Brown Course page for paid member".green
f.puts "Test now complete for Omniture tracking for Brene Brown Course page for paid member"

puts "End Time now #{obj_date.dt}".cyan
f.puts "End Time now #{obj_date.dt}"
f.puts ' '
f.close
browser.close

rescue Exception => e
  puts "Error nessage :"
  f.puts "Error nessage :"
  puts e
  puts 'problem with form submission for Omniture tracking for Brene Brown Course page for paid member' 
  f.puts 'problem with form submission for Omniture tracking for Brene Brown Course page for paid memeber'
  f.puts ' ' 
 browser.close
 f.close
end
