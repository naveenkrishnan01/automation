#!/usr/bin/env ruby
require 'rubygems'
require 'colorize'


require './FileCheck.rb';

f = File.open('output.txt', 'a')
puts "** THIS REGRESSION IS DONE USING FIREFOX BROWSER **".green
f.puts "** THIS REGRESSION IS DONE USING FIREFOX BROWSER **"
f.close
require './response-status.rb';
require './Origin_check.rb';
require './next_chapter.rb';
require './o_magazine.rb';
require './hometabs.rb';
require './ownTv.rb';
require './home_more.rb';
require './OmagSubscription.rb';
require './carousel.rb';
require './life-class.rb';
require './Package.rb' 
require './sendmail.rb'
