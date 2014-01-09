#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'
require '../browse-env.rb'

class NewsLetter < BrowseEnv
end	

@browser1 = ARGV[0]
@env = ARGV[1]

x = init(@browser1)
y = environment(@env)

configuration = JSON.parse(File.read('/Users/nkrishna/qa/FireFox/conf.json'))
url = configuration ["url"]

f = File.open('sharebar.txt', 'a')

puts "Starting Time now #{Time.now}".cyan
f.puts "Starting Time now #{Time.now}"
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
if y == 'betastg'
  browser.goto "http://betastg.oprah.com/spirit/Jane-Fondas-Daughter-Visits-Her-Biological-Family"
else
  browser.goto "http://www.oprah.com/spirit/Jane-Fondas-Daughter-Visits-Her-Biological-Family"
end

t = browser.link(:class, "noline ocom_purple")
if t.exists?
  puts "The print icon clicked  and  found on the article page spirit/Jane-Fondas-Daughter-Visits-Her-Biological-Family ".green
  f.puts "The print icon clicked and  found on the article page spirit/Jane-Fondas-Daughter-Visits-Her-Biological-Family"
 else
  puts "The print icon is NOT found on the article page spirit/Jane-Fondas-Daughter-Visits-Her-Biological-Family".red
      f.puts "The print icon is NOT found in the article page spirit/Jane-Fondas-Daughter-Visits-Her-Biological-Family"
 end

sleep 3;
browser.driver.save_screenshot("/Users/nkrishna/qa/FireFox/Regression/Sharebar/printIcon-JaneFonda.png")
t.click;

sleep 3;

puts "Test now complete for print icon on the article page".green
f.puts "Test now complete for print icon on the article page"

puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
f.puts ' '
f.close
browser.close

rescue Exception => e
  puts "Error nessage :"
  f.puts "Error nessage :"
  puts e
  puts 'problem with print icon on the article page' 
  f.puts 'problem with print icon on the article page' 
 browser.close
 f.puts ' '
 f.close
end
