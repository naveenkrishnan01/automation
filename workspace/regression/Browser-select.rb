#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'


class Carousal
end

def init(browser1)
 if browser1 == 'chrome'
   ARGV[0] = 'chrome'
 else
   ARGV[0] = ''	 
end
end 
@browser1 = ARGV[0]
a = init(@browser1)

configuration = JSON.parse(File.read('./conf.json'))
url = configuration ["url"]

f = File.open('output.txt', 'a')
puts "open the file"


puts "Starting Time now #{Time.now}".cyan
f.puts "Starting Time now #{Time.now}"
  
if a == 'chrome'
browser = Watir::Browser.new :chrome 
else
browser = Watir::Browser.new
end

browser.goto "#{url}";
browser.cookies.clear

sleep 2;
begin
###############################
# check the tabs for OWN TV and navigate back to Home page
##############################
browser.element(:xpath, ".//*[@id='triptypch_container']/div[3]/a[3]/img").click;
sleep 2;
browser.back;
browser.element(:xpath, ".//*[@id='triptypch_container']/div[3]/a[1]/img").click;
sleep 2;
browser.back;
browser.element(:xpath, ".//*[@id='triptypch_container']/div[3]/a[2]/img").click;
sleep 2;
browser.back;
puts " Test is now complete for carousal on home page".cyan
f.puts " Test is now complete for carousal on home page"

puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"
browser.close
f.close

rescue Exception => e
  puts "Error nessage :"
  f.puts "Error nessage :"
  puts e
  puts 'problem with form submission'
  f.puts 'problem with form submission'
  browser.close
  f.close
end
