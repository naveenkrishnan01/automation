require 'rubygems'

require 'colorize'

require 'net/https'
require "uri"
require "date"
require './req-resp-env.rb'

class Miscellaneous < ReqRespEnv
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

puts "*** Lifeclass , Iyanla , Packages  *******".green
f.puts "*** Lifeclass , Iyanla , Packages  *******"

     url = ["http://#{dom}.oprah.com",
         "http://#{dom}.oprah.com/own-oprahs-next-chapter/oprahs-next-chapter.html",
        "http://#{dom}.oprah.com/oprahs-lifeclass/oprahs-lifeclass.html",
        "http://#{dom}.oprah.com/own",
        "http://#{dom}.oprah.com/own-iyanla-fix-my-life/iyanla-social-buzz.html",
        "http://#{dom}.oprah.com/own-iyanla-fix-my-life/iyanla-fix-my-life.html",
        "http://#{dom}.oprah.com/own-iyanla-fix-my-life/iyanla-fix-my-life-episodes.html",
        "http://#{dom}.oprah.com/own-iyanla-fix-my-life/iyanla-fix-my-life-videos.html",
        "http://#{dom}.oprah.com/own-iyanla-fix-my-life/the-work.html",
        "http://#{dom}.oprah.com/packages/owners.html",
        "http://#{dom}.oprah.com/packages/video-page.html",
        "http://#{dom}.oprah.com/owners/OWNers-Events",
        "http://#{dom}.oprah.com/packages/engage.html",
        "http://#{dom}.oprah.com/packages/social.html",
        "http://#{dom}.oprah.com/packages/blog.html",
        "http://#{dom}.oprah.com/owners/About-OWNers-Frequently-Asked-Questions",
        "http://#{dom}.oprah.com/oprahs-lifeclass/oprahs-lifeclass-videos.html",
        "http://#{dom}.oprah.com/oprahs-lifeclass/oprahs-lifeclass-classes.html",
        "http://#{dom}.oprah.com/oprahs-lifeclass/life-work.html",
        "http://#{dom}.oprah.com/oprahs-lifeclass/webcast-landing.html"]

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
