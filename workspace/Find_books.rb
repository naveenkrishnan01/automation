#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'
require '../browse_env_check.rb'

class NewsLetter
 include BrowseEnvCheckable	
end	

m = NewsLetter.new
x = m.browsecheck(@browser)
y = m.EnvCheck(@env)

configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]

f = File.open('BookFinder.txt', 'a')

puts "Starting Time now #{Time.now}".cyan
f.puts "Starting Time now #{Time.now}"

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
# click on the newsletter link
##############################
#if y == 'betastg'
#  browser.goto "http://betastg.oprah.com/food/What-Do-You-Want-to-Eat"
#else
#  browser.goto "http://www.oprah.com/food/What-Do-You-Want-to-Eat"
#end

browser.text_field(:name, "q").set('Book Finder')
sleep 2;
t=browser.div(:class, "search_button");

button_result = t.exists? ? "Search Text box and button found" :  "Search Text box and button NOT found"
puts button_result.green
f.puts button_result
sleep 2;
t.click;
sleep 2;
browser.driver.save_screenshot("./screenShot_Bookfinder.png")
s=browser.element(:xpath => "html/body/table/tbody/tr/td/div[5]/div[1]/div[2]/div[5]/div[2]/div/div[3]/div[1]/a")
s.click;

puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
f.puts ' '
f.close
browser.close

rescue Exception => e
  puts "Error nessage :"
  f.puts "Error nessage :"
  puts e
  puts 'problem with Envelope Email icon on the article page food/What-Do-You-Want-to-Eat' 
  f.puts 'problem with Envelope Email icon on the article page food/What-Do-You-Want-to-Eat' 
 browser.close
 f.puts ' '
 f.close
end
