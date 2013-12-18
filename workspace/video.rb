#!/usr/bin/env ruby

require 'rubygems'
require 'resque/helpers'

require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'
require './browse-env.rb'

browser = Watir::Browser.new 
 
browser.goto 'http://www.oprah.com/own-super-soul-sunday/First-Look-Oprah-and-Author-Jack-Kornfield-on-Buddhism-Video'
sleep 2;	   

begin
###############################
# click on the newsletter link
##############################
puts browser.execute_script <<-JS
Global.videoPlayer.sendEvent("play")
JS
sleep 45;

puts browser.execute_script <<-JS
Global.videoPlayer.sendEvent("pause")
JS
sleep 5;

puts browser.execute_script <<-JS
Global.videoPlayer.sendEvent("play")
JS

rescue Exception => e
  puts "Error nessage :"
  puts e
  puts 'problem with print icon on the article page' 
 browser.close
end

