#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'
require '../browse-env.rb'
require '../date_time.rb'

class NewsLetter < BrowseEnv
  include DateTimeable
end	


@browser1 = ARGV[0]
@env = ARGV[1]

date_obj = NewsLetter.new

x = init(@browser1)
y = environment(@env)

configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]

f = File.open('output1.txt', 'a')

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
###############################
# click on the newsletter link
##############################
browser.link(:text, 'newsletters!').click;
sleep 3;
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
    puts " Join now button clicked on the Registration page".green
    f.puts "Join now button clicked on the Registration page"
else
    f.puts "Issue with the Join now button"
end

#*************************
# click the news letter page and submit
##*************************
sleep 5;
#browser.div(:class, 'chk_all checkbox_icon float').click;
if browser.div(:class, 'chk_all checkbox_icon float').exists?
  puts "New letter box clicked for all News letter".green
  f.puts "New letter box clicked for all News letter"
else
    f.puts "Issue with News letter box"	
end
browser.element(:xpath, ".//*[@id='ocom_newsletters']/div[3]/form/div[1]/div[3]/div[1]").fire_event('onclick');
browser.div(:id => 'chk_pop_80').click;
sleep 2;
browser.driver.save_screenshot("./Newsletter.png")
sleep 3;
#****************************
# Redirect to oprah.com, click the account settings and manage_news_letter to validate
#*******************************

browser.button(:id => 'finish_btn').click;
sleep 4;

username_link = browser.element(:xpath=> ".//*[@id='username']/a")

if username_link.exists?
puts " As expected, page redirects to oprah.com".green
f.puts "As expected, page redirects to oprah.com"
else
puts " Issue with redirect to oprah.com".red
f.puts " Issue with redirect to oprah.com"
end

username_link.click;
sleep 3;

browser.link(:text, "Account Settings").click
sleep 3;
browser.div(:id => 'newsletter_panel_switch_container').click;
sleep 2;
browser.driver.save_screenshot("./Newsletter-Finish.png")

puts "Test now complete for Omag Subscription for News letter checked redirecting to oprah.com. This is for the finish button".green
f.puts "Test now complete for Omag Subscription for News letter checked redirecting to oprah.com. This is for the Finish button"

puts "End Time now #{date_obj.dt}".cyan
f.puts "End Time now #{date_obj.dt}"
f.puts ' '
f.close
browser.close

rescue Exception => e
  puts "Error nessage :"
  f.puts "Error nessage :"
  puts e
  puts 'problem with form submission for Newsletter checked redirecting to oprah.com' 
  f.puts 'problem with form submission for Newsletter checked redirecting to oprah.com' 
 browser.close
 f.puts ' '
 f.close
end
