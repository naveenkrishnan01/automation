#!/usr/bin/env ruby

require 'rubygems'
require 'date'
require 'colorize'
require 'net/https'
require './req-resp-env.rb'

class Print < ReqRespEnv
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

puts "****Print (landings and Other pages)*****".green 
f.puts "****Print (landings and Other pages)*****" 


	 url = ["http://#{dom}.oprah.com/spirit/Rachel-Maddow-Interview-in-O-Magazine_1",
    "http://#{dom}.oprah.com/home/Martha-Beck-Addresses-Decorating-Anxiety/2",
  "http://#{dom}.oprah.com/spirit/How-to-Focus-Improve-Your-Attention-Span/2",
  "http://#{dom}.oprah.com/quote/Eckhart-Tolle-Quote-Quote-on-the-Present-Moment"]
 
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

