#!/usr/bin/env ruby
require 'rubygems'
require 'colorize'
require './device_type.rb'

class RunScript_device < Device_type
end

m = RunScript_device.new
m.check_arg(@name)  # Do not delete this

require './FileVerify.rb';

f = File.open('device_output.txt', 'a')
puts "** THIS REGRESSION IS DONE USING #{m.name} DEVICE and PRODUCTION Environment **".green
f.puts "** THIS REGRESSION IS DONE USING #{m.name} DEVICE and PRODUCTION  Environment **"
f.puts ' '
f.close
require './read_host.rb';
require './o_magazine.rb';
require './hometabs.rb';
require './ownTv.rb';
require './home_more.rb';
require './OmagSubscription.rb';
require './carousel.rb';
require './life-class.rb';
require './next_chapter.rb';
require './Package.rb' 
#require './sendmail.rb'
