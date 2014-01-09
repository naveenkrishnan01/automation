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

puts "**** LifeLift Blog URL ******".green

 b.goto "http://www.oprah.com/blogs/index.html"
 begin
 open "http://www.oprah.com/blogs/index.html"
  puts b.title
  rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah.com blogs - url 1".red
 end

 b.goto "http://www.oprah.com/blogs/Look-Who-Visited-Oprah" 
 begin
 open "http://www.oprah.com/blogs/Look-Who-Visited-Oprah"
  puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "Look who visited Oprah - url 2".red
 end

 b.goto "http://www.oprah.com/blogs/OWN-Announces-a-Special-Series-with-Lindsay-Lohan"
 begin
 open "http://www.oprah.com/blogs/OWN-Announces-a-Special-Series-with-Lindsay-Lohan"
   puts b.title
  rescue => e
   puts "Invalid URL #{e}" 
   puts "OWN Announces a special series with Lindsey Lohan - url 3".red 
 end

puts "**** Search ******".green

 b.goto "http://myown.oprah.com/search/index.html?q=feniger"
 begin
 open "http://myown.oprah.com/search/index.html?q=feniger"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "Search index.html - url 4".red
 end

puts "**** Add rewrite condition for Lifeclass print links ******".green
 
 b.goto "http://www.oprah.com/oprahs-lifeclass/Eckhart-Tolle-on-How-to-Free-Yourself-from-Your-Ego-Armor/print/1"
 begin
 open "http://www.oprah.com/oprahs-lifeclass/Eckhart-Tolle-on-How-to-Free-Yourself-from-Your-Ego-Armor/print/1"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "Eckhart Tolle on how to Free Yourself from Ego Armor - url 5".red
 end
 
puts "**** Add apache rewrite rule for show dated comments ******".green
 
b.goto "http://www.oprah.com/showinfo/The-Mom-Who-Married-a-Killer-Behind-Bars-and-Astonishing-Weddings"
 begin
 open "http://www.oprah.com/showinfo/The-Mom-Who-Married-a-Killer-Behind-Bars-and-Astonishing-Weddings"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "The mom who married a killer behind bars and Astonishing Weddings - url 6".red
 end
 

 b.goto "http://www.oprah.com/showinfo/The-Bravest-Families-in-America"
  begin 
  open "http://www.oprah.com/showinfo/The-Bravest-Families-in-America"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "The bravest families in America - url 7".red
 end
 
puts "**** Articles ******".green
 
b.goto "http://www.oprah.com/food/What-Do-You-Want-to-Eat"
  begin
   open "http://www.oprah.com/food/What-Do-You-Want-to-Eat"
    puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "Food what you want to Eat - url 8".red
 end
 
b.goto "http://www.oprah.com/oprahsbookclub/Oprahs-Book-Club_3"
 begin
  open "http://www.oprah.com/oprahsbookclub/Oprahs-Book-Club_3"
  puts b.title 
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah book Club -3 - url 9".red
 end
 

b.goto "http://www.oprah.com/oprahsbookclub/Take-the-Love-In-the-Time-of-Cholera-Quiz"
  begin   
 open "http://www.oprah.com/oprahsbookclub/Take-the-Love-In-the-Time-of-Cholera-Quiz"
  puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "Take the Love in the time of cholera quiz - url 10".red
 end
 
  puts "****** Videos *************".green

  b.goto "http://www.oprah.com/own/First-Look-Finding-Sarah-OWN-TV"
  begin
   open "http://www.oprah.com/own/First-Look-Finding-Sarah-OWN-TV"
   puts b.title 
 rescue => e
     puts "Invalid URL #{e}"
     puts "First look finding sarah-own-tv - url 11".red
 end
 
 b.goto "http://www.oprah.com/oprahs-lifeclass/Dr-Phil-What-It-Means-to-Be-the-Star-of-Your-Own-Life-Video"
   begin
  open "http://www.oprah.com/oprahs-lifeclass/Dr-Phil-What-It-Means-to-Be-the-Star-of-Your-Own-Life-Video"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "Dr Phil what it means to be the star of your own life - Video - url 12".red
 end

  b.goto "http://www.oprah.com/showinfo/American-Idol-Judges-Jennifer-Aniston-Adam-Sandler-and-Piers-Morgan"
   begin
 b.goto "http://www.oprah.com/showinfo/American-Idol-Judges-Jennifer-Aniston-Adam-Sandler-and-Piers-Morgan"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "American Idol Judges , Jennifer Aniston, Adam Sandler and Piers Morgan - url 13".red
 end
 
 puts "****** Styled (Landing & Other pages)*********".green

 b.goto "http://www.oprah.com/packages/os-makeup-bag.html"
   begin
  open "http://www.oprah.com/packages/os-makeup-bag.html"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "os makeup bag - url 14".red
 end

 b.goto "http://www.oprah.com/style/Spring-2013-Best-New-Lipsticks"
   begin
  open "http://www.oprah.com/style/Spring-2013-Best-New-Lipsticks"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "Spring 2013 Best New Lipstick - url 15".red
 end

 puts "***** Microsite (Landings & Other pages)*************".green
 b.goto "http://www.oprah.com/packages/freedom-riders.html"
   begin
  open "http://www.oprah.com/packages/freedom-riders.html"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "Freedom Riders - url 16".red
 end

 b.goto "http://www.oprah.com/oprahshow/Journey-to-Freedom-Retrace-the-Freedom-Rides"
   begin
  open "http://www.oprah.com/oprahshow/Journey-to-Freedom-Retrace-the-Freedom-Rides"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "Journey to Freedom Retrace  the Freedom Rides - url 17".red
 end

puts "******* Modular (Landings & Other pages)*********".green

 b.goto "http://www.oprah.com/packages/dark-girls.html"
   begin
  open "http://www.oprah.com/packages/dark-girls.html"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "Packages Dark girls - url 18".red
 end

 b.goto "http://www.oprah.com/oprahdotcom/How-a-Mother-Taught-Her-Daughter-About-Colorism-Video"
   begin
  open "http://www.oprah.com/oprahdotcom/How-a-Mother-Taught-Her-Daughter-About-Colorism-Video"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "How a mother taught her daughter about colorism - video - url 19".red
 end

puts "******* TV Show Sites (Landings and Other Pages)*********".green

 b.goto "http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass.html"
   begin
  open "http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass.html"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "Lifeclass oprahs-lifeclass - url 20".red
 end

 b.goto "http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass-classes.html"
   begin
  open "http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass-classes.html"
   puts b.title
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah life class - classes - url 21".red
 end

puts "End Time now #{Time.now}".cyan

b.close
