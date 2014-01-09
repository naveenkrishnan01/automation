#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'
require '../browse-env.rb'
require '../date_time.rb'

class OwnOprah < BrowseEnv
  include DateTimeable
end

@browser1 = ARGV[0]
@env = ARGV[1]

date_obj = OwnOprah.new
x = init(@browser1)
y = environment(@env)

configuration = JSON.parse(File.read('../conf.json'))
oprahLifeClass = configuration ["oprahLifeClass"]

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
browser.goto 'http://betastg.oprah.com/oprahsnextchapter'
Watir::Browser.start 'http://ownaccess:oprah@betamyown.oprah.com'
begin
 rescue Timeout::Error => e
 end
 elsif y == 'livestg'
 browser.cookies.clear
 browser.goto 'http://myown.oprah.com/cookieMgr.html'
 browser.text_field(:id => 'check_staging').set('1')
 browser.button(:class => 'btn btn-primary').click;
 sleep 3;
 browser.goto "#{oprahLifeClass}";
else
browser.goto "#{oprahLifeClass}"
browser.cookies.clear
end
 sleep 3;

begin
###############################
# click on Lab &  Prep work on LifeClass
##############################
browser.link(:class, 'nav_tab4').click;
sleep 3;

###############################
# click on first section of Lab & Notes, fill in the questions and click on the save button
##############################
browser.element(:xpath, ".//*[@id='package_list_wrapper']/div[2]/div[1]/div[1]/div[1]/a/img").click;
sleep 2;
# if the script breaks, change the comment number since it keeps changing. Use firebug to do it
browser.text_field(:name =>  'comment_46293').set "This is a test"
sleep 1;
browser.text_field(:name => 'comment_46294').set 'This is a test agian'
sleep 1;
browser.checkbox(:xpath => ".//*[@id='grant_permission']").set
sleep 1;
browser.div(:class, "show_save_button").click
sleep 2;
browser.driver.save_screenshot("./life_class_comments.png")
################################
# click on join on the Light box
################################
browser.link(:text => "or join").click;

#*****************************
# Randomization 
#*****************************
#username = ["nkggggg", "nktttt", "nkrrrrr", "nklllll"]
o = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
username = (0...6).map{ o[rand(o.length)] }.join
day = Random.new.rand(10..30)
month = Random.new.rand(1..9)
year = Random.new.rand(1950..1990)
#email = fnamesa + "." + lnamesa + Date.today.to_s + "@example.com"
email = username + Date.today.to_s + "@example.com"
#usernameb = usernamea + Date.today.to_s
firstname = (0...6).map{ o[rand(o.length)] }.join
lastname = (0...6).map{ o[rand(o.length)] }.join
#****************************
# Set field names in the form and submit
#*****************************
browser.text_field(:name, "email_address").set(email);
browser.text_field(:name, "displayname").set(username);
browser.text_field(:name, "firstname").set(firstname);
browser.text_field(:name, "lastname").set(lastname);
browser.execute_script("document.getElementById('password').value='jackie123';")
browser.execute_script("document.getElementById('password_confirm').value='jackie123';")
sleep 3;
browser.select_list(:name, "birth_month").select(month);
browser.select_list(:name, "birth_dayofmonth").select(day);
browser.select_list(:name, "birth_year").select(year);
sleep 2;
browser.element(:xpath => ".//*[@id='agree_to_terms']").click;
browser.div(:id, 'lc_submit_reg_btn').click
sleep 3;

browser.driver.save_screenshot("./oprah_life_class.png")
sleep 3;
#****************************
# Redirect to questionnare form that was entered initially
#*******************************

browser.button(:id => 'finish_btn').click;
sleep 4;

comment1 = browser.div(:class, 'item_comment')
  if comment1.exists?
    puts " The comment that was entered is seen".green
    f.puts " The comment that was entered - This is a test is displayed"
  else
    puts " The comment that was entered is not displayed".red
    f.puts " The comment that was entered is not displayed"
  end

#username_link = browser.element(:xpath=> ".//*[@id='username']/a")

#if username_link.exists?
#puts " As expected, page redirects to oprah.com".green
#f.puts "As expected, page redirects to oprah.com"
#else
#puts " Issue with redirect to oprah.com".red
#f.puts " Issue with redirect to oprah.com"
#end

#username_link.click;
#sleep 3;

#browser.link(:text, "Account Settings").click
#sleep 3;
#browser.div(:id => 'newsletter_panel_switch_container').click;
#sleep 2;
browser.driver.save_screenshot("./oprah_life_class_verify.png")

puts "Test now complete for Own Oprah Life class and redirectng to questionnare page with the comments entered earlier. This is for the finish button".green
f.puts "Test now complete for Own Oprah Life class and redirectng to questionnare page with the comments entered earlier. This is for the finish button"

puts "End Time now #{date_obj.dt}".cyan
f.puts "End Time now #{date_obj.dt}"
f.puts ' '
f.close
browser.close

rescue Exception => e
  puts "Error nessage :"
  f.puts "Error nessage :"
  puts e
  puts 'problem with Oprah Life class redirecting to questionnare page'.red 
  f.puts 'problem with Oprah Life class redirecting to questionnare page' 
 browser.close
 f.puts ' '
 f.close
end
