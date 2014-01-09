#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'

configuration = JSON.parse(File.read('./conf.json'))
url1 = configuration ["url1"]

puts "Starting Time now #{Time.now}".cyan
  
browser = Watir::Browser.new :chrome 

browser.goto "#{url1}";
browser.cookies.clear

#f = File.open('output.txt', 'w')
#f.puts "open the file"

begin
###############################
# check the tabs for Spirit, Health
##############################
if browser.link(:text, 'Join').exists?
  puts "Join link found".green
else
  puts " Join link not found".red
end

if browser.img(:src => "http://www.oprah.com/images/navigation/082710/Btn_SignIn_bf7e25_082510.png").exists?
  puts "Sign-in found".green
else
  puts  "Sign-in button not found"
end  

if browser.div(:class, "comment_post_button float_right").exists?
   puts "Comment Post button exists".green
else
   puts "Comment Post button does not exist".red
end

browser.goto 'wwwsrc.oprah.com/spirit.html';
puts "Spirit tab is tested for Origin Check".green
sleep 2;
browser.goto "#{url1}"
sleep 2;
browser.img(:xpath, ".//*[@id='triptypch_container']/div[3]/a[3]/img").click;
puts "featured videos tested for Origin Check".green
sleep 2;
browser.goto 'http://wwwsrc.oprah.com/own-super-soul-sunday/super-soul-sunday.html';
puts "check super soul sunday for Origin Check".green
sleep 2;
browser.goto "#{url1}"

puts "Test is now complete for Origin Check".green
puts "End Time now #{Time.now}".cyan
browser.close


rescue Exception => e
  puts "Error message :"
  puts e
browser.close
end








