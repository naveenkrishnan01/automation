#!/usr/bin/env ruby
require 'rubygems'
require 'colorize'
require './browse-env.rb'

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

#require '../FileCheck.rb';

f = File.open('output.txt', 'a')
puts "** THIS REGRESSION IS DONE USING #{browserName} BROWSER and #{env1} Environment **".green
f.puts "** THIS REGRESSION IS DONE USING #{browserName} BROWSER and #{env1} Environment **"
f.puts ' '
f.close
require '/Users/nkrishna/qa/FireFox/Regression/life-class.rb';
if y == 'livestg' || y == ''
require '/Users/nkrishna/qa/FireFox/Regression/next_chapter.rb';
end
require '/Users/nkrishna/qa/FireFox/Regression/Package.rb' 
#require './sendmail.rb'
