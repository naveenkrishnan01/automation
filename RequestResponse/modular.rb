require "net/http"
require "uri"
require "date"
require "colorize"
require './req-resp-env.rb'

class Modular < ReqRespEnv
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

puts "***** Modular (Landings and Other Pages)*******".green
f.puts "***** Modular (Landings and Other Pages)*******"

 url = ["http://#{dom}.oprah.com/packages/dark-girls.html",
 "http://#{dom}.oprah.com/oprahdotcom/How-a-Mother-Taught-Her-Daughter-About-Colorism-Video",
  "http://#{dom}.oprah.com/packages/owners.html",
  "http://#{dom}.oprah.com/owners/The-One-Thing-All-Oprahs-Master-Class-Guests-Have-in-Common-Video",
   "http://#{dom}.oprah.com/packages/video-page.html",
  "http://#{dom}.oprah.com/packages/blog.html",
  "http://#{dom}.oprah.com/packages/empower-yourself.html",
   "http://#{dom}.oprah.com/spirit/Life-Lessons-You-Need-to-Learn-on-the-Way-to-50",
  "http://#{dom}.oprah.com/packages/entertainment-arts.html"]
 
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
