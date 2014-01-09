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
  browser.goto "http://betastg.oprah.com/food/What-Do-You-Want-to-Eat"
else
  browser.goto "http://www.oprah.com/food/What-Do-You-Want-to-Eat"
end

t = browser.div(:class, "comment_box_icon")
 if t.exists?
  puts "The comment icon is found and clicked on the article page /food/What-Do-You-Want-to-Eat".green
  f.puts "The comment icon is found and clicked on the article page /food/What-Do-You-Want-to-Eat"
 else
  puts "The comment icon is NOT found on the article page".red
      f.puts "The comment icon is NOT found in the article page"
 end

 t.click

sleep 3;

puts "Test now complete for comment icon on the article page /food/What-Do-You-Want-to-Eat".green
f.puts "Test now complete for comment icon on the article page /food/What-Do-You-Want-to-Eat"

puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
f.puts ' '
f.close
browser.close

rescue Exception => e
  puts "Error nessage :"
  f.puts "Error nessage :"
  puts e
  puts 'problem with comment icon on the article page food/What-Do-You-Want-to-Eat' 
  f.puts 'problem with comment icon on the article page food/What-Do-You-Want-to-Eat' 
 browser.close
 f.puts ' '
 f.close
end
