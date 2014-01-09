#!/usr/bin/env ruby

require 'rubygems'
require 'date'
require 'colorize'
require 'open-uri'

require 'watir-webdriver'
b = Watir::Browser.new :phantomjs

puts "Starting Time now #{Time.now}".cyan

 b.goto "www.oprah.com"
 begin
 open "http://www.oprah.com"
  puts b.title + "  " + "http://www.oprah.com".green
  rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah home Page failed - url 1".red
 end

 b.goto "http://www.oprah.com/packages/freedom-by-jonathan-franzen-oprahs-book-club.html" 
 begin
 open "http://www.oprah.com/packages/freedom-by-jonathan-franzen-oprahs-book-club.html"
  puts b.title + "  " + "http://www.oprah.com/packages/freedom-by-jonathan-franzen-oprahs-book-club.html".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah book club Url failed - url 2".red
 end

 
 b.goto "http://www.oprah.com/packages/freedom-by-jonathan-franzen-oprahs-book-clubs.html"
 begin
 open "http://www.oprah.com/packages/freedom-by-jonathan-franzen-oprahs-book-clubs.html"
   puts b.title + "  " + "http://www.oprah.com/packages/freedom-by-jonathan-franzen-oprahs-book-clubs.html".green
  rescue => e
   puts "Invalid URL #{e}" 
   puts "Oprah Soul series web cast failed - url 3".red 
 end

 b.goto "https://subscribe.hearstmags.com/subscribe/splits/oprah/opr_gift_footer"
 begin
 open "http://www.oprah.com/entertainment/Past-Harpo-Films"
   puts b.title + "  " + "http://www.oprah.com/entertainment/Past-Harpo-Films".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah book club Url failed - url 4".red
 end
 
 b.goto "http://www.oprah.com/entertainment/Past-Harpo-Films"
 begin
 open "http://www.oprah.com/entertainment/Past-Harpo-Films"
   puts b.title + "  " + "http://www.oprah.com/entertainment/Past-Harpo-Films".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah book club Url failed - url 5".red
 end
 
 b.goto "http://www.oprah.com/own-doc-club/doc-club.html"
 begin
 open "http://www.oprah.com/own-doc-club/doc-club.html"
   puts b.title + "  " + "http://www.oprah.com/own-doc-club/doc-club.html".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah book club Url failed - url 6".red
 end
 

 b.goto "http://www.oprah.com/packages/a-date-with-charles-dickens-oprahs-book-club-2.html"
  begin 
  open "http://www.oprah.com/packages/a-date-with-charles-dickens-oprahs-book-club-2.html"
   puts b.title + "  " + "http://www.oprah.com/packages/a-date-with-charles-dickens-oprahs-book-club-2.html".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah book club Url failed - url 7".red
 end
 
b.goto "http://www.oprah.com/oprahradio/O-The-Oprah-Magazine-Show-on-Oprah-Radio"
  begin
   open "http://www.oprah.com/oprahradio/O-The-Oprah-Magazine-Show-on-Oprah-Radio"
    puts b.title + "  " + "http://www.oprah.com/oprahradio/O-The-Oprah-Magazine-Show-on-Oprah-Radio".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah book club Url failed - url 8".red
 end
 
b.goto "http://www.oprah.com/angel_network.html"
 begin
  open "http://www.oprah.com/angel_network.html"
  puts b.title + "  " + "http://www.oprah.com/angel_network.html".green 
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah book club Url failed - url 9".red
 end
 

b.goto "http://www.oprah.com/oprahradio/About-Oprah-Radio-Host-Derrick-N-Ashong"
  begin   
 open "http://www.oprah.com/oprahradio/About-Oprah-Radio-Host-Derrick-N-Ashong"
  puts b.title + "  " + "http://www.oprah.com/oprahradio/About-Oprah-Radio-Host-Derrick-N-Ashong".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah book club Url failed - url 10".red
 end
 
  b.goto "http://www.oprah.com/oprahradio/About-Oprah-Radio-Host-Dr-Laura-Berman"
  begin
   open "http://www.oprah.com/oprahradio/About-Oprah-Radio-Host-Dr-Laura-Berman"
   puts b.title + "  " + "http://www.oprah.com/oprahradio/About-Oprah-Radio-Host-Dr-Laura-Berman".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah book club Url failed - url 11".red
 end
 
 b.goto "http://www.oprah.com/oprahradio/About-Oprah-Radio-Host-Dr-Mehmet-Oz"
   begin
  open "http://www.oprah.com/oprahradio/About-Oprah-Radio-Host-Dr-Mehmet-Oz"
   puts b.title + "  " + "http://www.oprah.com/oprahradio/About-Oprah-Radio-Host-Dr-Mehmet-Oz".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah book club Url failed - url 12".red
 end

puts "End Time now #{Time.now}".cyan

b.close
