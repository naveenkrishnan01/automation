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

puts "******* TV SHOW SITES (Landings and Other Pages)*********".green 

 b.goto "http://www.oprah.com/own-golden-sisters/golden-sisters.html"
 begin
 open "http://www.oprah.com/own-golden-sisters/golden-sisters.html"
  puts b.title + "  " + "http://www.oprah.com/own-golden-sisters/golden-sisters.html".green
  rescue => e
     puts "Invalid URL #{e}"
     puts "Golden sisters - url 1".red
 end

 b.goto "http://www.oprah.com/own-goldensisters/blogs/Twerking-like-Miley-Cyrus-and-Making-it-Rain---Golden-Sisters-Style" 
 begin
 open "http://www.oprah.com/own-goldensisters/blogs/Twerking-like-Miley-Cyrus-and-Making-it-Rain---Golden-Sisters-Style"
  puts b.title + "  " + "http://www.oprah.com/own-goldensisters/blogs/Twerking-like-Miley-Cyrus-and-Making-it-Rain---Golden-Sisters-Style".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Twerking like Miley Cyrus and making it Rain- Golden Sisters Style - url 2".red
 end

 b.goto "http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass.html"
 begin
 open "http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass.html"

   puts b.title + " " + "http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass.html".green
  rescue => e
   puts "Invalid URL #{e}" 
   puts "Oprah Life Class - url 3".red 
 end

 b.goto "http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass-classes.html"
 begin
 open "http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass-classes.html"
   puts b.title + "  " + "http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass-classes.html".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprahs lifclass classes - url 4".red
 end
 
 b.goto "http://www.oprah.com/own-oprahs-next-chapter/oprahs-next-chapter.html"
 begin
 open "http://www.oprah.com/own-oprahs-next-chapter/oprahs-next-chapter.html"
   puts b.title + "  " + "http://www.oprah.com/own-oprahs-next-chapter/oprahs-next-chapter.html".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprahs next chapter - url 5".red
 end
 
 b.goto "http://www.oprah.com/own-oprahs-next-chapter/Behind-the-Scenes-Photos-From-Oprahs-Interview-with-John-Legend"
 begin
 open "http://www.oprah.com/own-oprahs-next-chapter/Behind-the-Scenes-Photos-From-Oprahs-Interview-with-John-Legend"
   puts b.title + "  " + "http://www.oprah.com/own-oprahs-next-chapter/Behind-the-Scenes-Photos-From-Oprahs-Interview-with-John-Legend".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Behind the scene photos from Oprahs Interview with John Legend url 6".red
 end
 
 
puts "End Time now #{Time.now}".cyan

b.close
