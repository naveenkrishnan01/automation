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

puts "****Micorsite (landings and Other pages)*****".green 

 b.goto "http://www.oprah.com/packages/freedom-riders.html"
 begin
 open "http://www.oprah.com/packages/freedom-riders.html"
  puts b.title + ' ' + 'http://www.oprah.com/packages/freedom-riders.html'.green  
  rescue => e
     puts "Invalid URL #{e}"
     puts "Package Freedom Riders - url 1".red
 end

 b.goto "http://www.oprah.com/oprahshow/Journey-to-Freedom-Retrace-the-Freedom-Rides" 
 begin
 open "http://www.oprah.com/oprahshow/Journey-to-Freedom-Retrace-the-Freedom-Rides"
  puts b.title + ' ' + 'http://www.oprah.com/oprahshow/Journey-to-Freedom-Retrace-the-Freedom-Rides'.green  
 rescue => e
     puts "Invalid URL #{e}"
     puts "Journey to Freedom Retrace the Freedom Rides - url 2".red
 end

 b.goto "http://www.oprah.com/packages/snl-on-the-oprah-show.html"
 begin
 open "http://www.oprah.com/packages/snl-on-the-oprah-show.html"
  puts b.title + ' ' + 'http://www.oprah.com/packages/snl-on-the-oprah-show.html'.green  
  rescue => e
   puts "Invalid URL #{e}" 
   puts "SNL on the oprah show - url 3".red 
 end

 b.goto "http://www.oprah.com/packages/aarp-caregiving.html"
 begin
 open "http://www.oprah.com/packages/aarp-caregiving.html"
  puts b.title + ' ' + 'http://www.oprah.com/packages/aarp-caregiving.html'.green  
   rescue => e
     puts "Invalid URL #{e}"
     puts "AARP Caregiving - url 4".red
 end
 
 
puts "End Time now #{Time.now}".cyan

b.close
