#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require 'date'
require 'json'
require './browse-env.rb'
require './date_time.rb'

class Entertain < BrowseEnv
 include DateTimeable
end	

@browser1 = ARGV[0]
@env = ARGV[1]

add_obj = Entertain.new 
x = init(@browser1)
y = environment(@env)

configuration = JSON.parse(File.read('./conf.json'))
url = configuration ["url"]

puts "Starting Time now #{add_obj.dt}".cyan
if x == 'chrome'
   browser = Watir::Browser.new :chrome
elsif x == 'ff'
 browser = Watir::Browser.new
else
 browser = Watir::Browser.new
end
   if y == 'betastg'
     browser.goto 'http://ownaccess:oprah@betamyown.oprah.com/dump.html'
     browser.goto 'http://ownaccess:oprah@betastg.oprah.com/index.html'
   elsif y == 'livestg'
     browser.goto 'http://myown.oprah.com/cookieMgr.html'
     browser.text_field(:id => 'check_staging').set('1')
     browser.button(:class => 'btn btn-primary').click;
     sleep 3;
      browser.goto "#{url}";
    else
      browser.goto "#{url}"
    end
      browser.cookies.clear


#f = File.open('output.txt', 'w')
#f.puts "open the file"

begin
###############################
# check the tabs for Spirit, Health
##############################
browser.link(:text, 'Entertainment').click;
sleep 2;
t = browser.div(:class => "sl_pad")
 if t.exists?
    puts "Featured Image found for Entertainment and clicked on the feature".green
 else
    puts "Feature Image not found for Entertainment Page".red
 end

browser.element(:xpath => ".//*[@id='package_content_container']/div[1]/div/div/div[1]/table/tbody/tr[1]/td/a/img").click;
sleep 2;

browser.link(:text, 'Entertainment').click;
sleep 5;

m = browser.div(:class => "sl_item")
  if m.exists?
   puts "Promo Image found for Entertainment and clicked on the promo".green
  else
    puts "Promo Image not found for Entertainment Page".red
  end

browser.element(:xpath => ".//*[@id='package_content_container']/div[2]/div[2]/div/div[1]/div[1]/a/img").click;
sleep 2;

browser.back;

l = browser.element(:xpath => ".//*[@id='package_content_container']/div[3]/div[1]/div/div/div[2]/div/div[2]/div[1]/a");
 if l.exists?
  puts "Get to know your celebrity article page clicked".green
 else
  puts "Get to know your celebrity article page NOT FOUND".red
 end

l.click; 
sleep 3;

puts "Test is now complete for Entertainment Page".green
puts "End Time now #{add_obj.dt}".cyan
browser.close


rescue Exception => e
  puts "Error message :"
  puts e
browser.close
end








