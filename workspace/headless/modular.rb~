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

puts "***** Modular (Landings and Other Pages)*******".green

 b.goto "http://www.oprah.com/packages/dark-girls.html"
 begin
 open "http://www.oprah.com/packages/dark-girls.html"
  puts b.title + " " + "http://www.oprah.com/packages/dark-girls.html".green
  rescue => e
     puts "Invalid URL #{e}"
     puts "Dark Girls Documentary Film - url 1".red
 end

 b.goto "http://www.oprah.com/oprahdotcom/How-a-Mother-Taught-Her-Daughter-About-Colorism-Video" 
 begin
 open "http://www.oprah.com/oprahdotcom/How-a-Mother-Taught-Her-Daughter-About-Colorism-Video"
  puts b.title + " " + "http://www.oprah.com/oprahdotcom/How-a-Mother-Taught-Her-Daughter-About-Colorism-Video".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "How a mother taught her daughter about Colorism - video - url 2".red
 end

 b.goto "http://www.oprah.com/packages/owners.html"

 begin
 open "http://www.oprah.com/packages/owners.html"

   puts b.title + " " + "http://www.oprah.com/packages/owners.html".green
  rescue => e
   puts "Invalid URL #{e}" 
   puts "Packages - OWNERS - url 3".red 
 end

 b.goto "http://www.oprah.com/owners/The-One-Thing-All-Oprahs-Master-Class-Guests-Have-in-Common-Video"
 begin
 open "http://www.oprah.com/owners/The-One-Thing-All-Oprahs-Master-Class-Guests-Have-in-Common-Video"
   puts b.title + " " + "http://www.oprah.com/owners/The-One-Thing-All-Oprahs-Master-Class-Guests-Have-in-Common-Video".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "The one thing all Oprahs Masters Class Guest Have in Common Video - url 4".red
 end
 
 b.goto "http://www.oprah.com/packages/video-page.html"
 begin
 open "http://www.oprah.com/packages/video-page.html"
   puts b.title + " " + "http://www.oprah.com/packages/video-page.html".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Packages video Page - url 5".red
 end
 
 b.goto "http://www.oprah.com/packages/blog.html"
 begin
 open "http://www.oprah.com/packages/blog.html"
   puts b.title + "  " +  "http://www.oprah.com/packages/blog.html".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Packages - Blog - url 6".red
 end
 
 b.goto "http://www.oprah.com/packages/empower-yourself.html"
 begin
 open "http://www.oprah.com/packages/empower-yourself.html"
   puts b.title + "  " + "http://www.oprah.com/packages/empower-yourself.html".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Empower Yourself - url 6".red
 end
 
 b.goto "http://www.oprah.com/spirit/Life-Lessons-You-Need-to-Learn-on-the-Way-to-50"
 begin
 open "http://www.oprah.com/spirit/Life-Lessons-You-Need-to-Learn-on-the-Way-to-50"
   puts b.title + " " + "http://www.oprah.com/spirit/Life-Lessons-You-Need-to-Learn-on-the-Way-to-50".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Life Lessons You Need to Learn on the Way to 50 - url 6".red
 end
 
 b.goto "http://www.oprah.com/packages/entertainment-arts.html"
 begin
 open "http://www.oprah.com/packages/entertainment-arts.html"
   puts b.title + " " + "http://www.oprah.com/packages/entertainment-arts.html".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Packages Entertainment Arts - url 6".red
 end
 
puts "End Time now #{Time.now}".cyan

b.close
