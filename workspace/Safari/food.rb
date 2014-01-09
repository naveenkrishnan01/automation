#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'
require './browse-env.rb'

class Food < BrowseEnv
end

@browser1 = ARGV[0]
@env = ARGV[1]

x = init(@browser1)
y = environment(@env)

configuration = JSON.parse(File.read('./conf.json'))
url = configuration ["url"]

puts "Starting Time now #{Time.now}".cyan
if x == 'chrome'
  browser = Watir::Browser.new :chrome
elsif x == 'ff'
 browser = Watir::Browser.new
else
 browser = Watir::Browser.new
end
if y == 'betastg'
  browser.goto 'http://ownaccess:oprah@betamyown.oprah.com/dump.html'
  browser.goto 'http://ownaccess:oprah@betastg.oprah.com/index.html'
 elsif y == 'livestg'
  browser.goto 'http://myown.oprah.com/cookieMgr.html'
  browser.text_field(:id => 'check_staging').set('1')
  browser.button(:class => 'btn btn-primary').click;
  sleep 3;
  browser.goto "#{url}";
 else
 browser.goto "#{url}"
 end
 browser.cookies.clear

#f = File.open('output.txt', 'w')
#f.puts "open the file"

begin
###############################
# check the tabs for Spirit, Health
##############################
browser.link(:text, 'Food').click;
sleep 2;
t = browser.div(:class => "homepage_image featured_story1")
 if t.exists?
    puts "Featured Image found for Food and clicked on the feature".green
 else
    puts "Feature Image not found for Food Page".red
 end

browser.element(:xpath => ".//*[@id='ocom_content_wrapper']/div[1]/div[2]/div[1]/a/img").click;
sleep 2;
browser.back;

m = browser.div(:class => "promo_image")
  if m.exists?
   puts "Promo Image found for Food and clicked on the promo".green
  else
    puts "Promo Image not found for Food Page".red
  end

browser.element(:xpath => ".//*[@id='feat_sub_container']/div[2]/div[2]/div[1]/a/img").click;
sleep 2;

browser.back;

l = browser.element(:xpath => ".//*[@id='feed_results']/div[8]/div[2]/div[1]/a/img");
 if l.exists?
  puts "The article feed clicked on the Food page".green
 else
  puts "Article feed not found on Food page".red
 end

l.click; 
sleep 3;

puts "Test is now complete for Food Page".green
puts "End Time now #{Time.now}".cyan
browser.close


rescue Exception => e
  puts "Error message :"
  puts e
browser.close
end








