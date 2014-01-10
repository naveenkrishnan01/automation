#!/usr/bin/env ruby
require 'net/http'
require 'uri'
require 'date'
require 'colorize'
require './req-resp-env.rb'

class OldStyle < ReqRespEnv
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

puts "***** STYLED (Landings & Other Pages)*******".green
f.puts "***** STYLED (Landings & Other Pages)*******"

 url = ["http://#{dom}.oprah.com/packages/os-makeup-bag.html",
  "http://#{dom}.oprah.com/style/Spring-2013-Best-New-Lipsticks",
    "http://#{dom}.oprah.com/packages/spring-fashion.html",
   "http://#{dom}.oprah.com/style/Swimsuit-Trends-Best-Swimwear-2013",
   "http://#{dom}.oprah.com/packages/connection.html",
  "http://#{dom}.oprah.com/relationships/Invisible-Signs-of-Love/1"]

 
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

