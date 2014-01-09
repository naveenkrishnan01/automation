require 'rubygems'
require 'colorize'

require 'watir-webdriver'

require 'date'
require 'nokogiri'
require 'open-uri'


#url = "http://www.oprah.com"
url = "http://o20.oprah.com/demo/www/"

doc = Nokogiri::HTML(open(url)) 

news_links = doc.css("a")
news_links.each{|link|
        t=[].to_s
	link1 = link['href']
       t = link1.to_s
        puts t 
puts doc.errors if (doc.errors.any?)

#       	puts "#{link1}\t#{link.text}"
}


  puts "****PARSING THE HOMEPAGE TO CHECK number of url used for #{url}******"
#browser.close 
