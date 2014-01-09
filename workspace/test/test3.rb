require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'
#require 'nokogiri'
require 'uri'


puts "Starting Time now #{Time.now}"

browser = Watir::Browser.new
browser.cookies.clear
browser.goto 'http://betastg.oprah.com/index.html?utm_source=jme_test'
#saved_cookies = browser.cookies.to_a

puts browser.execute_script('return s.eVar20');	      
puts browser.execute_script('return s.prop14');	      

#puts saved_cookies[6]
browser.close

