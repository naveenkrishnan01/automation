#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'
require './browse-env.rb'
require './date_time.rb'

class Video < BrowseEnv
 include DateTimeable
end

add_obj = Video.new
@browser1 = ARGV[0]
@env = ARGV[1]

x = init(@browser1)
y = environment(@env)

configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]

f = File.open('output.txt', 'a')
puts "open the file"

puts "Starting Time now #{add_obj.dt}".cyan
f.puts "Starting Time now #{add_obj.dt}"
puts "Script started is video.rb"

if x == 'chrome'
   browser = Watir::Browser.new :chrome
elsif
   x == 'ff'
   browser = Watir::Browser.new
else
   browser = Watir::Browser.new
end

if y == 'betastg'
   browser.goto 'http://ownaccess:oprah@betamyown.oprah.com/dump.html'
   browser.goto 'http://ownaccess:oprah@betastg.oprah.com/index.html'
elsif y == 'livestg'
   browser.cookies.clear
   browser.goto 'http://myown.oprah.com/cookieMgr.html'
   browser.text_field(:id => 'check_staging').set('1')
   browser.button(:class => 'btn btn-primary').click;
 sleep 3;
   browser.goto "#{url}";
 else
   browser.goto "#{url}"
   browser.cookies.clear
end

begin

browser.link(:text, 'Videos').click;
sleep 2;

browser.element(:xpath, "html/body/table/tbody/tr/td/div[2]/div[1]/div/div[2]/div[1]/a/img").click;
sleep 4;


###############################
# click the video on the page 
##############################
if y == 'prod' || y == ''
browser.execute_script <<-JS
Global.videoPlayer.sendEvent("play")
JS
sleep 45;

browser.execute_script <<-JS
Global.videoPlayer.sendEvent("pause")
JS
sleep 5;

browser.execute_script <<-JS
Global.videoPlayer.sendEvent("play")
JS
sleep 20;
end

if y == 'betastg'
browser.execute_script <<-JS
amp.play();
JS
sleep 45;

browser.execute_script <<-JS
amp.pause();
JS
sleep 5;

browser.execute_script <<-JS
amp.play();
JS
sleep 20;
end

puts "Test is now complete for Video".green
f.puts "Test is now complete for Video"
puts "End Time now #{add_obj.dt}".cyan
f.puts "End Time now #{add_obj.dt}"
f.puts ' '

browser.close
f.close

rescue Exception => e
  puts "Error nessage :"
  puts e
  puts 'problem with Video page and Video play' 
 browser.close
 f.close
end

