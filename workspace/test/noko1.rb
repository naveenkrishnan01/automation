require 'rubygems'
require 'colorize'

require 'watir-webdriver'

require 'date'
require 'nokogiri'
require 'open-uri'

#browser = Watir::Browser.new 

#page = Nokogiri::HTML(open("http://myown.oprah.com/community/library/activity.html?entity_id=210950900"))
page = Nokogiri::HTML(open("http://www.oprah.com"))
links = page.css("a")
      links.each do |a|
#	if  a["href"] == "http://myown.oprah.com/community/library/activity.html"
	  puts a["href"]
 #       end	  :wq
	  #      
    end   	
   
#browser.close 
