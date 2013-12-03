require "net/http"
require "uri"
require 'colorize'
require 'date'
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

puts "****Micorsite (landings and Other pages)*****".green
f.puts "****Micorsite (landings and Other pages)*****"

url = ["http://#{dom}.oprah.com/oprahshow/Journey-to-Freedom-Retrace-the-Freedom-Rides", 
	"http://#{dom}.oprah.com/packages/freedom-riders.html",
         "http://#{dom}.oprah.com/packages/snl-on-the-oprah-show.html",
         "http://#{dom}.oprah.com/packages/aarp-caregiving.html"]

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
