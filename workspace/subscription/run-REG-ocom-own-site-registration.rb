#!/usr/bin/env ruby
require 'rubygems'
require 'colorize'
require '../browse-env.rb'
class RunRegScript < BrowseEnv
end

@browser1 = ARGV[0]
@env = ARGV[1]

x = init(@browser1)
y = environment(@env)

if x == 'ff'
	 browserName = 'FireFox'
elsif x == 'chrome'
	 browserName = 'Chrome'
else
	  browserName = 'FireFox'
end

if y == 'livestg'
	  env1 = 'LIVESTAGE'
elsif y == 'betastg'
	  env1 = 'BETASTG'
else
	 env1 = 'PRODUCTION'
end

require '../FileVerify.rb';

f = File.open('output1.txt', 'a')
puts "** THIS REGRESSION FOR REGISTRATION IS DONE USING #{browserName} BROWSER and #{env1} Environment **".green
f.puts "** THIS REGRESSION FOR REGISTRATION IS DONE USING #{browserName} BROWSER and #{env1} Environment **"
f.puts ' '
f.close
#require './read_host1.rb';
require './News-letter-finish.rb';
require './Omag-finish-offer.rb';
require './Omag-skip-offer.rb';
if y == 'livestg' || y == '' || y == 'prod'
require './Own-oprah-Lifeclass.rb';
require './newFBOmagSubscription.rb'
end
require './General-reg-sendmail.rb'
