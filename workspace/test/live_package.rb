#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'
require 'nokogiri'
require 'open-uri'

configuration = JSON.parse(File.read('./conf.json'))
url = configuration ["url"]
url2 = configuration ["url2"]

f = File.open('output.txt', 'a')
puts "open the file"

puts "Starting Time now #{Time.now}".cyan
puts "Starting Time now #{Time.now}"
  
browser = Watir::Browser.new
browser.cookies.clear;

browser.goto "#{url2}";
browser.text_field(:id => 'check_staging').set('1')
browser.button(:class => 'btn btn-primary').click;

sleep 5;

browser.goto "#{url}";

#url3 = "http://www.oprah.com/index.html"
doc = Nokogiri::HTML.parse(browser.html)
  doc.xpath('//comment()').each do |a_tag|
 puts a_tag.content
  end
    puts '****PARSING THE HOMEPAGE TO CHECK FOR THE SERVER ******'
    sleep 2;

begin
###############################
# check the tabs for Spirit, Health
##############################
browser.goto 'http://www.oprah.com/packages/spring-fashion.html';
puts "Pacakage for spring-fashion link is tested".green
f.puts "Pacakage for spring-fashion link is tested"
sleep 2;
#browser.link(:text, 'Your Ultimate Swimsuit Guide').click;
#sleep 2;

browser.goto 'http://www.oprah.com/packages/express-yourself.html';
browser.link(:text, 'Show Us Your Creativity').click;
puts "The page redirects to oprah.com for Show us your Creativity".green
f.puts "The page redirects to oprah.com for Show us your Creativity"
sleep 2;

browser.goto 'http://www.oprah.com/packages/express-yourself.html';
browser.link(:text, 'The Power of Poetry').click;
puts "The page redirects to oprah.com for Power of Poetry".green 
f.puts "The page redirects to oprah.com for Power of Poetry" 
sleep 2;
puts "Test is now complete for Package Check".green
f.puts "Test is now complete for Package Check"
puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
browser.close
f.close

rescue Exception => e
  puts "Error message :"
  f.puts "Error message :"
  puts e
  puts " Issue with Package".red
  f.puts "Issue with Package"
browser.close
f.close
end








