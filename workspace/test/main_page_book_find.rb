#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
require 'nokogiri'
require 'open-uri'
require 'json'
require '../browse_env_check.rb'
require '../date_time.rb'

class MainPage
 include BrowseEnvCheckable
 include DateTimeable 
end	

client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 180 # seconds – default is 60

m = MainPage.new
x = m.browsecheck(@browser)
y = m.EnvCheck(@env)
date_obj = MainPage.new

configuration = JSON.parse(File.read('../conf.json'))
url = configuration ["url"]

f = File.open('BookFinder.txt', 'a')

puts "Starting Time now #{date_obj.dt}".cyan
f.puts "****Starting Time now #{date_obj.dt}****"

browser = m.browseEnv(@name)

 if y == 'betastg'
browser.goto 'http://ownaccess:oprah@betamyown.oprah.com/dump.html'
browser.goto 'http://ownaccess:oprah@betastg.oprah.com/index.html'
begin
rescue Timeout::Error => e
end
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
 sleep 3;
	   

begin
###############################
# click on the newsletter link
##############################

if y == 'betastg'
 browser.goto "http://betastg.oprah.com/finder/book/index.html"
else 
 browser.goto "http://www.oprah.com/finder/book/index.html"
end

sleep 3;


browser.driver.save_screenshot("./MainPage_Bookfinder.png")

# close window pop-up
browser.execute_script("window.onbeforeunload = null")
browser.send_keys :enter

#browser.close rescue nil

#t = browser.a(:href, 'http://www.oprah.com/finder/book/index.html')
#bf_header_result = t.exists? ? "BOOK FINDER header found with url http://www.oprah.com/finder/book/index.html" : "Book finder header not found"
#puts bf_header_result.green
#f.puts bf_header_result
#sleep 2;

m = browser.element(:xpath => "html/body/table/tbody/tr/td/div[5]/div[2]/div[1]/div[1]/div[1]/div")
main_image_result = m.exists? ? "The main image on the page exists" : "Main image on the page is not found"
puts main_image_result.green
f.puts main_image_result
sleep 2;

n = browser.element(:xpath => "html/body/table/tbody/tr/td/div[5]/div[2]/div[1]/div[1]/div[2]/div[2]")
first_img_right = n.exists? ? " First image on the Spotlight found" :"First image on the Spotlight not found"
puts first_img_right.green
f.puts first_img_right
sleep 2;

o = browser.element(:xpath => "html/body/table/tbody/tr/td/div[5]/div[2]/div[1]/div[1]/div[2]/div[3]")
second_img_right = o.exists? ? " Second image on the Spotlight found" : "Second image on the Spotlight not found"
puts second_img_right.green
f.puts second_img_right
sleep 2;

p = browser.element(:xpath => "html/body/table/tbody/tr/td/div[5]/div[2]/div[1]/div[1]/div[2]/div[4]")
third_img_right = p.exists? ? " Third image on the Spotlight found" : "Third image on the Spotlight not found"
puts third_img_right.green
f.puts third_img_right
sleep 2;

q = browser.element(:xpath => "html/body/table/tbody/tr/td/div[5]/div[2]/div[1]/div[1]/div[2]/div[4]")
fourth_img_right = q.exists? ? " Fourth image on the Spotlight found" : "Fourth image on the Spotlight not found"
puts fourth_img_right.green
f.puts fourth_img_right
sleep 2;

img1 = browser.element(:xpath => "html/body/table/tbody/tr/td/div[5]/div[2]/div[1]/div[2]/div[2]/div/div[1]/div[1]/a/img")
editor_pick1 = img1.exists? ? " First image of the editor pick found" : "First Image of the editor pick not found"
puts editor_pick1.green
f.puts editor_pick1
sleep 2;

img2 = browser.element(:xpath => "html/body/table/tbody/tr/td/div[5]/div[2]/div[1]/div[2]/div[2]/div/div[2]/div[1]/a/img")
editor_pick2 = img2.exists? ? " Second image of the editor pick found" : "Second Image of the editor pick not found"
puts editor_pick2.green
f.puts editor_pick2
sleep 2;

img3 = browser.element(:xpath => "html/body/table/tbody/tr/td/div[5]/div[2]/div[1]/div[2]/div[2]/div/div[3]/div[1]/a/img")
editor_pick3 = img3.exists? ? " Third image of the editor pick found" : "Third Image of the editor pick not found"
puts editor_pick3.green
f.puts editor_pick3
sleep 2;

img4 = browser.element(:xpath => "html/body/table/tbody/tr/td/div[5]/div[2]/div[1]/div[2]/div[2]/div/div[3]/div[1]/a/img")
editor_pick4 = img4.exists? ? " Fourth image of the editor pick found" : "Fourth Image of the editor pick not found"
puts editor_pick4.green
f.puts editor_pick4
sleep 2;

#Oprah's Book club
o_title = browser.div(:class, "rr_header rr_padding7")
o_book_title = o_title.exists? ? "Oprah Book club header found" : "Oprah Book club NOT found"
puts o_book_title.green
f.puts o_book_title
sleep 2;

o_book = browser.element(:xpath, "html/body/table/tbody/tr/td/div[5]/div[2]/div[1]/div[3]/div[1]/div[1]/div[2]/a/img")
img_o_book = o_book.exists? ? "Oprah Book club image exists" : "Oprah book club image DOES not exist"
puts img_o_book.green
f.puts img_o_book
sleep 2;


book_fsearch = browser.img(:src, "http://www.oprah.com/images/finder/book/Header_BookFinderSearch_trans_101910.png")
book_finder_search  = book_fsearch.exists? ? "Book Finder Search box found" : "Book Finder search box DOES not exist"
puts book_finder_search.green
f.puts book_finder_search
sleep 2;


right_column = browser.element(:xpath, "html/body/table/tbody/tr/td/div[5]/div[2]/div[1]/div[3]/div[2]")
right_column_content  = right_column.exists? ? "Right column list and Right column promo found" : "Right column list and Right column NOT found"
puts right_column_content.green
f.puts right_column_content
sleep 2;


header_ad = browser.element(:xpath, "//*[@id='dart_ad_leaderboard']/a/img")
header_ad_disp  = header_ad.exists? ? "Header Ad found in Book Finder page" : "Header Ad NOT found in Book Finder page"
puts header_ad_disp.green
f.puts header_ad_disp
sleep 2;

#texts = browser.spans(:class => "rh-title collapsed-box").map do |span|
#	  span.text
#end

google_ad = browser.div(:id, 'ad_adsense')
google_text  = google_ad.exists? ? "Google ad text found" : "Google AD text NOT found"
puts google_text.green
f.puts google_text
sleep 2;

puts "The links found for the Header and  footer are as follows".green
f.puts ' '
f.puts "***The links found for the Header and footer are as follows***"

begin
url = "http://www.oprah.com/finder/book/index.html"

doc = Nokogiri::HTML(open(url))

news_links = doc.css("div#ocom_header a")
news_links.each{|link|
	        link1=[]
		  link1 = link['href']
		   if  link['href'] != ("javascript:void(0)")
		    puts "#{link1}\t#{link.text}"
		   f.puts "#{link1}\t#{link.text}"
		  end
		   }
	        books = doc.css("div#book_landing_container a")[0]['href']
		books1 = doc.css("div#book_landing_container a")[0].text
		puts "#{books}\t" + ' ' + "#{books1}"
		f.puts "#{books}\t" + ' ' + "#{books1}"

f.puts ' '
puts " This is for the right column list items ".green
f.puts " **This is for the right column list items *** "
books = doc.css("div#book_landing_container a")[24]['href']
books1 = doc.css("div#book_landing_container a")[24].text
puts "#{books}\t" +  ' ' + "#{books1}".green
f.puts "#{books}\t" +  ' ' + "#{books1}"


books = doc.css("div#book_landing_container a")[25]['href']
books1 = doc.css("div#book_landing_container a")[25].text
puts "#{books}\t" +  ' ' + "#{books1}".green
f.puts "#{books}\t" +  ' ' + "#{books1}"


books = doc.css("div#book_landing_container a")[26]['href']
books1 = doc.css("div#book_landing_container a")[26].text
puts "#{books}\t" +  ' ' + "#{books1}".green
f.puts "#{books}\t" +  ' ' + "#{books1}"


books = doc.css("div#book_landing_container a")[27]['href']
books1 = doc.css("div#book_landing_container a")[27].text
puts "#{books}\t" +  ' ' + "#{books1}".green
f.puts "#{books}\t" +  ' ' + "#{books1}"

f.puts ' '
puts " This is the url and text for the Kids reading list "
f.puts " ***This is the url and text for the Kids reading list ** "
books = doc.css("div#module_112 a")[0]['href']
books1 = doc.css("module_112 a")[0]
puts "#{books}\t" + ' ' + "#{books1}".green
f.puts "#{books}\t" + ' ' + "#{books1}"

end

puts "Test now complete Book Finder Main Page".green
f.puts ' '
f.puts "***Test now complete Book Finder Main Page***"

puts "End Time now #{date_obj.dt}".cyan
f.puts "****End Time now #{date_obj.dt}****"
f.puts ' '
f.close
browser.close

rescue Exception => e
  puts "Error nessage :"
  f.puts "Error nessage :"
  puts e
  puts 'problem with Book Finder Main Page'.red 
  f.puts 'problem with Book Finder Main Page' 
 browser.close
 f.puts ' '
 f.close
end
