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

puts "***** VIDEO REGRESSION URL ********".green

b.goto "http://www.oprah.com/oprahshow/No-Phone-Zone-Widget"
 begin
  open "http://www.oprah.com/oprahshow/No-Phone-Zone-Widget"
  puts b.title 
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah Show No Phone Zone Widget - url 9".red
 end
 
b.goto "http://myown.oprah.com/audition/index.html"
  begin   
 open "http://myown.oprah.com/audition/index.html"

  puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "Audition Index html - url 10".red
 end
 
  b.goto "http://myown.oprah.com/audition/index.html?request=video_details&response_id=5615"
  begin
   open "http://myown.oprah.com/audition/index.html?request=video_details&response_id=5615"
   puts b.title 
 rescue => e
     puts "Invalid URL #{e}"
     puts "Request - video details, response-id  - url 11".red
 end
 
puts "End Time now #{Time.now}".cyan

b.close
