#!/usr/bin/env ruby

require 'rubygems'
require 'date'
require 'colorize'
require 'open-uri'

require 'watir-webdriver'

#** To fix the time out issue
client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 180 # seconds – default is 60

b = Watir::Browser.new :phantomjs, :http_client => client

puts "Starting Time now #{Time.now}".cyan

puts "***** VIDEO REGRESSION URL ********".green

 b.goto "http://www.oprah.com/relationships/How-To-Teach-Your-Child-to-Be-Bullyproof-Video"
 begin
 open "http://www.oprah.com/relationships/How-To-Teach-Your-Child-to-Be-Bullyproof-Video"
  puts b.title + " " + "http://www.oprah.com/relationships/How-To-Teach-Your-Child-to-Be-Bullyproof-Video".green
  rescue => e
     puts "Invalid URL #{e}"
     puts "How to teach your child to be Bully Prood Video - url 1".red
 end

 b.goto "http://www.oprah.com/home/Leading-the-Fight-Against-Lead" 
 begin
 open "http://www.oprah.com/home/Leading-the-Fight-Against-Lead"
  puts b.title + "  " + "http://www.oprah.com/home/Leading-the-Fight-Against-Lead".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Leading the Fight Against Lead - url 2".red
 end

 b.goto "http://www.oprah.com/oprahshow/Watch-the-Full-Hour-Americas-New-Deadly-Obsession-Video"
 begin
 open "http://www.oprah.com/oprahshow/Watch-the-Full-Hour-Americas-New-Deadly-Obsession-Video"
   puts b.title + "  " + "http://www.oprah.com/oprahshow/Watch-the-Full-Hour-Americas-New-Deadly-Obsession-Video".green
  rescue => e
   puts "Invalid URL #{e}" 
   puts "Watch the Full Hour Americas New Deadly Obssession video - url 3".red 
 end

 b.goto "http://www.oprah.com/own-dr-laura-berman-show/Web-Exclusive-I-Dont-Like-Giving-Oral-Sex-What-Do-I-Do
"
 begin
 open "http://www.oprah.com/own-dr-laura-berman-show/Web-Exclusive-I-Dont-Like-Giving-Oral-Sex-What-Do-I-Do
"
   puts b.title + "  " + "http://www.oprah.com/own-dr-laura-berman-show/Web-Exclusive-I-Dont-Like-Giving-Oral-Sex-What-Do-I-Do".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "I dont like giving Oral sex what do i do - url 4".red
 end
 
 b.goto "http://www.oprah.com/own/First-Look-Finding-Sarah-OWN-TV"
 begin
 open "http://www.oprah.com/own/First-Look-Finding-Sarah-OWN-TV"
   puts b.title + "  " + "http://www.oprah.com/own/First-Look-Finding-Sarah-OWN-TV".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "First llok finding Sarah OWN TV - url 5".red
 end
 
 b.goto "http://www.oprah.com/showinfo/Oprahs-Farewell-Season-Premiere-with-Special-Guest-John-Travolta"
 begin
 open "http://www.oprah.com/showinfo/Oprahs-Farewell-Season-Premiere-with-Special-Guest-John-Travolta"
   puts b.title + "  " + "http://www.oprah.com/showinfo/Oprahs-Farewell-Season-Premiere-with-Special-Guest-John-Travolta".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "OPrah Season Premiere with Special Guest John Travolta - url 6".red
 end
 

 b.goto "http://www.oprah.com/showinfo/American-Idol-Judges-Jennifer-Aniston-Adam-Sandler-and-Piers-Morgan"
  begin 
  open "http://www.oprah.com/showinfo/American-Idol-Judges-Jennifer-Aniston-Adam-Sandler-and-Piers-Morgan"
   puts b.title + "  " + "http://www.oprah.com/showinfo/American-Idol-Judges-Jennifer-Aniston-Adam-Sandler-and-Piers-Morgan".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "American Idol Judges Jennifer Anitson, Adam Sandler and Piers Morgan - url 7".red
 end
 
b.goto "http://www.oprah.com/oprahshow/Star-Studded-Moments-from-Oprahs-Surprise-Farewell-Part-1/2"
  begin
   open "http://www.oprah.com/oprahshow/Star-Studded-Moments-from-Oprahs-Surprise-Farewell-Part-1/2"
    puts b.title + "  " + "http://www.oprah.com/oprahshow/Star-Studded-Moments-from-Oprahs-Surprise-Farewell-Part-1/2".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Star Studded Moments from Oprahs Surprise Farewell Part-1/2 - url 8".red
 end
 
b.goto "http://www.oprah.com/oprahshow/No-Phone-Zone-Widget"
 begin
  open "http://www.oprah.com/oprahshow/No-Phone-Zone-Widget"
  puts b.title + "  " + "http://www.oprah.com/oprahshow/No-Phone-Zone-Widget".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah Show No Phone Zone Widget - url 9".red
 end
 
b.goto "http://myown.oprah.com/audition/index.html"

  begin   
 open "http://myown.oprah.com/audition/index.html"
  puts b.title + " " + "http://myown.oprah.com/audition/index.html".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Audition Index html - url 10".red
 end
 
  b.goto "http://myown.oprah.com/audition/index.html?request=video_details&response_id=5615"
  begin
   open "http://myown.oprah.com/audition/index.html?request=video_details&response_id=5615"
  puts b.title + "  " + "http://myown.oprah.com/audition/index.html?request=video_details&response_id=5615".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Request - video details, response-id  - url 11".red
 end
 
 b.goto "http://myown.oprah.com/audition/index.html?request=make_video&tab=showcase_talent"
   begin
  open "http://myown.oprah.com/audition/index.html?request=make_video&tab=showcase_talent"
   puts b.title + "  " + "http://myown.oprah.com/audition/index.html?request=make_video&tab=showcase_talent".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Make videos - Show case talent - url 12".red
 end

  b.goto "http://www.oprah.com/own-ask-oprahs-all-stars/ask-oprahs-all-stars.html"
   begin
 b.goto "http://www.oprah.com/own-ask-oprahs-all-stars/ask-oprahs-all-stars.html"
   puts b.title + " " + "http://www.oprah.com/own-ask-oprahs-all-stars/ask-oprahs-all-stars.html".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Ask Oprah all stars - url 13".red
 end

 b.goto "http://www.oprah.com/oprahs-lifeclass/Dr-Phil-What-It-Means-to-Be-the-Star-of-Your-Own-Life-Video"
   begin
  open "http://www.oprah.com/oprahs-lifeclass/Dr-Phil-What-It-Means-to-Be-the-Star-of-Your-Own-Life-Video"
   puts b.title + "  " + "http://www.oprah.com/oprahs-lifeclass/Dr-Phil-What-It-Means-to-Be-the-Star-of-Your-Own-Life-Video".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Phil what it means to be the star of your own life Video - url 14".red
 end

 b.goto "http://www.oprah.com/own-super-soul-sunday/Super-Soul-Sunday-Full-Episode-Meditation-101-Video"
   begin
  open "http://www.oprah.com/own-super-soul-sunday/Super-Soul-Sunday-Full-Episode-Meditation-101-Video"
   puts b.title + "  " + "http://www.oprah.com/own-super-soul-sunday/Super-Soul-Sunday-Full-Episode-Meditation-101-Video".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Super Soul Sunday Full Episode Meditiation - 101-Video - url 15".red
 end

puts "End Time now #{Time.now}".cyan

b.close
