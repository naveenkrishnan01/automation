#!/usr/bin/env ruby

require 'rubygems'
require 'date'
require 'colorize'
require 'uri'
require 'net/https'
require './req-resp-env.rb'

class Video < ReqRespEnv
end

@env1 = ARGV[0]
env_check = environ(@env1)

 if env_check == 'betastg'
   dom = 'betastg'
 elsif env_check == 'testserver'
   dom = 'www-test'
 else
   dom = 'www'
  end

 f = File.open('RequestResponse.txt', 'a')

puts "Starting Time now #{Time.now}".cyan
f.puts "Starting Time now #{Time.now}"

puts "***** VIDEO REGRESSION URL ********".green
f.puts "***** VIDEO REGRESSION URL ********"

 url = ["http://#{dom}.oprah.com/relationships/How-To-Teach-Your-Child-to-Be-Bullyproof-Video",
    "http://#{dom}.oprah.com/home/Leading-the-Fight-Against-Lead",		
  "http://#{dom}.oprah.com/oprahshow/Watch-the-Full-Hour-Americas-New-Deadly-Obsession-Video",
   "http://#{dom}.oprah.com/own-dr-laura-berman-show/Web-Exclusive-I-Dont-Like-Giving-Oral-Sex-What-Do-I-Do",
  "http://#{dom}.oprah.com/own/First-Look-Finding-Sarah-OWN-TV",
 "http://#{dom}.oprah.com/showinfo/Oprahs-Farewell-Season-Premiere-with-Special-Guest-John-Travolta",
   "http://#{dom}.oprah.com/showinfo/American-Idol-Judges-Jennifer-Aniston-Adam-Sandler-and-Piers-Morgan",
     "http://#{dom}.oprah.com/oprahshow/Star-Studded-Moments-from-Oprahs-Surprise-Farewell-Part-1/2",
    "http://#{dom}.oprah.com/oprahshow/No-Phone-Zone-Widget",
#   "http://myown.oprah.com/audition/index.html",
#     "http://myown.oprah.com/audition/index.html?request=video_details&response_id=5615",
#    "http://myown.oprah.com/audition/index.html?request=make_video&tab=showcase_talent",
   "http://#{dom}.oprah.com/own-ask-oprahs-all-stars/ask-oprahs-all-stars.html",
   "http://#{dom}.oprah.com/oprahs-lifeclass/Dr-Phil-What-It-Means-to-Be-the-Star-of-Your-Own-Life-Video",
   "http://#{dom}.oprah.com/own-super-soul-sunday/Super-Soul-Sunday-Full-Episode-Meditation-101-Video",
   "http://#{dom}.oprah.com/own-six-little-mcghees/Deleted-Scenes-Daddy-and-Me-One-on-One-Day-Isaac-Video"]

url.each_with_index do |val,index|
	uri = URI.parse(val)#{index}

	http = Net::HTTP.new(uri.host, uri.port)
	request = Net::HTTP::Get.new(uri.request_uri)
	request.basic_auth("ownaccess", "oprah")
	res = http.request(request)
	if res.code == '200' || res.code ==  '301' 
	    puts res.code + "  " + "Looking good for url :#{val}".green       
	    f.puts res.code + "  " + "Looking good for url :#{val}"       
	else
	   puts res.code + " "  + "Issue with the url : #{val}".red      
	   f.puts res.code + " "  + "Issue with the url : #{val}"     
	end
end

puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
f.puts ' '
f.close
