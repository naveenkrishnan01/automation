#!/usr/bin/env ruby
require 'rubygems'
require 'colorize'
require '/Users/nkrishna/workspace/test/browse_env_check.rb'

class RunScript
 include BrowseEnvCheckable	
end

m = RunScript.new
x = m.browsecheck(@browser)
y = m.EnvCheck(@env)

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

require '/Users/nkrishna/qa/FireFox/Regression/FileVerify.rb';

f = File.open('output1.txt', 'a')
puts "** THIS REGRESSION IS DONE USING #{browserName} BROWSER and #{env1} Environment **".green
f.puts "** THIS REGRESSION IS DONE USING #{browserName} BROWSER and #{env1} Environment **"
f.puts ' '
f.close
require './Omag-Omniture-register.rb';
require './bb_existing_register.rb';
require './bb_register.rb';
require './Omniture_sendmail.rb'
