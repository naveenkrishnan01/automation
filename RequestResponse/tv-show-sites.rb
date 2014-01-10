#!/usr/bin/env ruby

require 'rubygems'
require 'date'
require 'colorize'
require 'uri'
require 'net/https'
require './req-resp-env.rb'

class MicroSite < ReqRespEnv
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

puts "******* TV SHOW SITES (Landings and Other Pages)*********".green 
f.puts "******* TV SHOW SITES (Landings and Other Pages)*********" 

 url = ["http://#{dom}.oprah.com/own-golden-sisters/golden-sisters.html",
         "http://#{dom}.oprah.com/own-goldensisters/blogs/Twerking-like-Miley-Cyrus-and-Making-it-Rain---Golden-Sisters-Style",
          "http://#{dom}.oprah.com/oprahs-lifeclass/oprahs-lifeclass.html",
          "http://#{dom}.oprah.com/own-oprahs-next-chapter/oprahs-next-chapter.html",
      "http://#{dom}.oprah.com/own-oprahs-next-chapter/Behind-the-Scenes-Photos-From-Oprahs-Interview-with-John-Legend"]
 

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

