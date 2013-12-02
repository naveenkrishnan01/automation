#!/usr/bin/env ruby

require 'rubygems'
require 'date'
require 'colorize'
#require 'open-uri'
require "net/https"
require 'uri'
require './req-resp-env.rb'

class Article < ReqRespEnv
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

puts "**** Article Page Types URL ******".green
f.puts "**** Article Page Types URL ******"

        url =  ["http://#{dom}.oprah.com/health/100-Pounds-Before-and-After",
                 "http://#{dom}.oprah.com/oprahdotcom/In-th-Green-Room-With-Pink",
                  "http://#{dom}.oprah.com/oprahshow/Fran-Drescher-and-Peter-Jacobson/5",
                  "http://#{dom}.oprah.com/spirit/Jane-Fondas-Daughter-Visits-Her-Biological-Family",
                  "http://#{dom}.oprah.com/food/Top-Chef-Masters-Susan-Feniger-Talks-About-Her-Love-of-Street-Food_1",
   "http://#{dom}.oprah.com/oprahradio/Why-Chinese-Mothers-Are-Superior-Audio",
    "http://#{dom}.oprah.com/food/Throw-a-Halloween-Cocktail-Party",
    "http://#{dom}.oprah.com/food/Pub-Fare-Menu",
   "http://#{dom}.oprah.com/relationships/How-We-Met_2",
     "http://#{dom}.oprah.com/style/How-to-Find-Your-Own-Style",
     "http://#{dom}.oprah.com/relationships/Denzel-Jerry-Barbra-and-More-Celebrities-Talk-Love",
    "http://#{dom}.oprah.com/style/The-Best-February-2011-Beauty-Products",
    "http://#{dom}.oprah.com/food/What-Do-You-Want-to-Eat",
    "http://#{dom}.oprah.com/oprahsbookclub/Oprahs-Book-Club_3",
    "http://#{dom}.oprah.com/oprahsbookclub/Take-the-Love-In-the-Time-of-Cholera-Quiz",
   "http://#{dom}.oprah.com/money/Suze-Ormans-Quiz-Are-You-Filling-the-Void-by-Overspending",
    "http://#{dom}.oprah.com/relationships/Quiz-What-Women-Can-Learn-from-Men_1",
    "http://#{dom}.oprah.com/food/Frozen-Yogurt-Banana-Pops",
   "http://#{dom}.oprah.com/food/Crab-Cake-Sliders-with-Spicy-Mayo",
   "http://#{dom}.oprah.com/world/A-Costa-Rican-Nature-Retreat-Sweepstakes/1",
   "http://#{dom}.oprah.com/relationships/Pick-Your-Perfect-Getaway-Sweepstakes/1",
   "http://#{dom}.oprah.com/entertainment/The-Oprah-Show-Goes-Hollywood-Sweepstakes_2/1",
    "http://#{dom}.oprah.com/relationships/Family-and-Fun-at-Your-Fingertips-Sweepstakes-Official-Rules_1"]

url.each_with_index do |val,index|
	uri = URI.parse(val)#{index}
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true if domain = ~/^https/
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

