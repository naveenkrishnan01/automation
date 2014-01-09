#!/usr/bin/env ruby

require 'rubygems'
require 'date'
require 'colorize'
require 'open-uri'

require 'watir-webdriver'
client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 180 # seconds – default is 60

b = Watir::Browser.new :phantomjs, :http_client => client

puts "Starting Time now #{Time.now}".cyan

puts "***** STYLED (Landings & Other Pages)*******".green

 b.goto "http://www.oprah.com/packages/os-makeup-bag.html"
 begin
 open "http://www.oprah.com/packages/os-makeup-bag.html"
  puts b.title + " " + "http://www.oprah.com/packages/os-makeup-bag.html".green
  rescue => e
     puts "Invalid URL #{e}"
     puts "os makeup-bag - url 1".red
 end

 b.goto "http://www.oprah.com/style/Spring-2013-Best-New-Lipsticks" 
 begin
 open "http://www.oprah.com/style/Spring-2013-Best-New-Lipsticks"
  puts b.title +  "  " + "http://www.oprah.com/style/Spring-2013-Best-New-Lipsticks".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Spring 2013 Best New Lipsticks - url 2".red
 end

 b.goto "http://www.oprah.com/packages/spring-fashion.html"

 begin
 open "http://www.oprah.com/packages/spring-fashion.html"
   puts b.title + "  " + "http://www.oprah.com/packages/spring-fashion.html".green
  rescue => e
   puts "Invalid URL #{e}" 
   puts "Spring Fashion - url 3".red 
 end

 b.goto "http://www.oprah.com/style/Swimsuit-Trends-Best-Swimwear-2013"
 begin
 open "http://www.oprah.com/style/Swimsuit-Trends-Best-Swimwear-2013"
   puts b.title + "  " + "http://www.oprah.com/style/Swimsuit-Trends-Best-Swimwear-2013".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Swimsuit Trends Best Swimwear-2013 - url 4".red
 end
 
 b.goto "http://www.oprah.com/packages/connection.html"
 begin
 open "http://www.oprah.com/packages/connection.html"
   puts b.title + "  " + "http://www.oprah.com/packages/connection.html".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Packages Connection - url 5".red
 end
 
 b.goto "http://www.oprah.com/relationships/Invisible-Signs-of-Love/1"
 begin
 open "http://www.oprah.com/relationships/Invisible-Signs-of-Love/1"
   puts b.title + "  " + "http://www.oprah.com/relationships/Invisible-Signs-of-Love/1".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Invisible signs of Love - url 6".red
 end
 
puts "End Time now #{Time.now}".cyan

b.close
