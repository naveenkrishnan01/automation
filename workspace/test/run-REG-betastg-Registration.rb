#!/usr/bin/env ruby

require 'rubygems'
require 'selenium-webdriver'
require 'watir-webdriver'
require 'mysql'
require 'date'
require 'colorize'

puts "Starting Time now #{Time.now}"

browser = Watir::Browser.new 
browser.goto 'http://ownaccess:oprah@betamyown.oprah.com/dump.html'
begin
browser.goto 'http://ownaccess:oprah@betastg.oprah.com/index.html'
sleep 5;

#****************************************************************
# click on the Join and enter the registration form - Randomization
# ***************************************************************
browser.link(:href, 'http://betamyown.oprah.com/register.html').click;
sleep 2;
o = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
username = (0...6).map{ o[rand(o.length)] }.join
#password = (0...8).map{ o[rand(o.length)] }.join
day = Random.new.rand(10..30)
month = Random.new.rand(1..9)
email = username + Date.today.to_s + "@example.com"

#****************************
## Set field names in the form
##*****************************
browser.text_field(:name, "email_address").set(email);
browser.text_field(:name, "username").set(username);
browser.text_field(:name, "password").set("hello123");
browser.text_field(:name, "password_confirm").set("hello123");
sleep 3;
browser.select_list(:name, "birth_month").select(month);
browser.select_list(:name, "birth_dayofmonth").select(day);
browser.select_list(:name, "birth_year").select("1980");
browser.driver.save_screenshot("/Users/nkrishna/workspace/test/register.png")
browser.div(:id => 'agree_checkbox', :class => 'checkbox_icon').click;
browser.div(:class => 'btn_joinnow_ocom float', :id => 'submit_reg_btn').click;
sleep 5;
browser.button(:id => 'finish_btn', :class => 'ocom_button_dark').click;
puts "email: #{email}";
puts "Password: hello123"
email1 = email.to_s 

sleep 5;
browser.close


rescue Exception => e
        puts "Error nessage :"
	 #   f.puts "Error nessage :"
        puts e
        puts 'problem with form submission on Omag subscription with nothing checked for Ocom account'
	#	  f.puts 'problem with form submission on Omag subscription with nothing checked for Ocom account'
        browser.close
	#	      f.close
end





#****************************
# Connect to Datbases
#****************************
begin
	db = Mysql.real_connect("chiownsql01.myown.int", "nkrishnan", "@utom@t3", "maui_master")
	 puts "CONNECTION SUCCESSFUL".green

#	  puts "Starting Time now #{Time.now}".cyan
	               puts 'Querying the Database'.green
	               puts 'Auth-id' + '   ' + 'Email' + '                 ' + 'password'

             ts = db.query "SELECT auth_id, email, password from maui_master.auth where email = '#{email1}'"
	    # Loop thru the rows
	     ts.each_hash do |row|
		puts row['auth_id'] + " " + row ['email'] + " " + row['password']
	     end
     
          puts "End Time now #{Time.now}".cyan

rescue Mysql::Error => e
            puts "Error code: #{e.errno}"
             puts "Error message: #{e.error}"
            puts "Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")
ensure
	          db.close if db
end











