#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'json'
#require './browse-env.rb'

f = File.open('own2.txt', 'a')
puts "open the file"

puts "Start Time now #{Time.now}".cyan
f.puts "Start Time now #{Time.now}"

browser = Watir::Browser.new 
 
browser.goto 'http://o20-dev.oprah.com/'
sleep 2;	   

begin
###############################
# click on the newsletter link
##############################

t = browser.div(:class, "icon-grid")
if t.exists?
  puts "The icon grid exists ".green
  f.puts "The icon grid exists "
 else
  puts "The icon grid does NOT exists".red
  f.puts "The icon grid does NOT exists"
 end

t.click;

sleep 3;

a = browser.div(:id => "videos")
sleep 2;
b = browser.div(:id => "dashboard_app_collection_wrapper").div(:index => 1)

c = browser.div(:id => "own_tv")
sleep 2;
d = browser.div(:id => "dashboard_app_collection_wrapper").div(:index => 2)

a.drag_and_drop_on b
puts b.exists? ? "Icon moved from Feature to 1st slot on favourites".green : "Problem with move to 1st slot on the favourites".red
f.puts b.exists? ? "Icon moved from Feature to 1st slot on favourites" : "Problem with move to 1st slot on the favourites"
sleep 3;

c.drag_and_drop_on d
puts d.exists? ? "Icon moved from Feature to 2nd slot on favourites".green : "Problem with move to 2nd slot on the favourites".red
f.puts d.exists? ? "Icon moved from Feature to 2nd slot on favourites" : "Problem with move to 2nd slot on the favourites"
sleep 3;

browser.div(:id, "browse-apps-nav").click
sleep 2;
a.drag_and_drop_by 100, -200
puts "flyout functionality works".green
f.puts "flyout functionality works"
sleep 3;

browser.div(:class, "page_nav_btn btn2").click;
scroll1 = browser.div(:class, "page_nav_btn btn2")
puts scroll1.exists? ? "Scroll to section 2 works".green : "Scroll to section 2 is an issue".red
f.puts scroll1.exists? ? "Scroll to section 2 works" : "Scroll to section 2 is an issue"
sleep 3;

browser.div(:class, "page_nav_btn btn3").click
scroll2 = browser.div(:class, "page_nav_btn btn3")
puts scroll2.exists? ? "Scroll to section 3 works".green : "Scroll to section 3 is an issue".red
f.puts scroll2.exists? ? "Scroll to section 3 works" : "Scroll to section 3 is an issue"
sleep 3;

browser.div(:class, "page_nav_btn btn1").click
scroll3 = browser.div(:class, "page_nav_btn btn1")
puts scroll3.exists? ? "Scroll to section 1 works".green : "Scroll to section 1 is an issue".red
f.puts scroll3.exists? ? "Scroll to section 1 works" : "Scroll to section 1 is an issue"
sleep 3;

browser.execute_script("window.scrollTo(0, document.body.scrollHeight);\n")
puts "scroll from top to bottom functionality works".green
f.puts "scroll from top to bottom functionality works"
sleep 3;

browser.button(:class, "icon-search").click
icon_search = browser.button(:class, "icon-search")
puts icon_search.exists? ? "Search button clicked".green : "Search button not clicked".red
f.puts icon_search.exists? ? "Search button clicked" : "Search button not clicked"
sleep 3;

browser.text_field(:id, "search-query").set 'Br'
puts "Suggestive search works".green
f.puts "Suggestive search works"
sleep 3;

browser.close


puts "Test now complete for OWN2".green
f.puts "Test now complete for OWN2"

puts "End Time now #{Time.now}".cyan
f.puts "End Time now #{Time.now}"

browser.close

rescue Exception => e
  puts "Error nessage :"
  puts e
  puts 'problem with own2 home page navigation'.red 
  f.puts 'problem with own2 home page navigation' 
 browser.close
end
