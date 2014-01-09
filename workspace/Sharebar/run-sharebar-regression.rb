#!/usr/bin/env ruby
require 'rubygems'
require 'colorize'
require '../browse-env.rb'

class RunScript < BrowseEnv
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

f = File.open('sharebar.txt', 'a')
puts "** THIS REGRESSION IS DONE USING #{browserName} BROWSER and #{env1} Environment **".green
f.puts "** THIS REGRESSION IS DONE USING #{browserName} BROWSER and #{env1} Environment **"
f.puts ' '
f.close
require './print.rb';
require './comment.rb';
require './EnvelopeMail.rb';
require './pinterest.rb';
require './twitter.rb';
require './FBlike.rb';
require './sendmail-sharebar.rb'
