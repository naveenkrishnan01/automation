#!/usr/bin/env ruby

require 'rubygems'
require 'test/unit'
require 'selenium-webdriver'


class Own2 < Test::Unit::TestCase

def setup
 # This used only for Sauce labs, please run Sauce connect because this site has firewall
 caps = Selenium::WebDriver::Remote::Capabilities.chrome
 caps.version = "31"
 caps.platform = "OS X 10.9"
 caps[:name] = "Testing own2.0 on Mac and chrome31"

 @driver = Selenium::WebDriver.for(
  :remote,
  :url => "http://naveenowntv:0b1e7c7d-6543-496c-a561-858666f3b81b@ondemand.saucelabs.com:80/wd/hub",
  :desired_capabilities => caps)

# The below script used only for local
#@driver = Selenium::WebDriver.for :chrome

end

def test
###############################
# click on the newsletter link
##############################
sleep 3;

@driver.get 'http://o20-dev.oprah.com/demo/www/'
sleep 5;

@driver.find_element(:class, "icon-grid").click
sleep 2;

dragElement = @driver.find_element(:xpath, ".//*[@id='videos']/div/div/a/img");

dropElement = @driver.find_element(:xpath, ".//*[@id='dashboard_app_collection_wrapper']/div[1]/div");

dragElement1 = @driver.find_element(:xpath, ".//*[@id='own_tv']/div");

dropElement1 = @driver.find_element(:xpath, ".//*[@id='dashboard_app_collection_wrapper']/div[2]/div");

@driver.action.drag_and_drop(dragElement, dropElement).perform
sleep 2;

@driver.action.drag_and_drop(dragElement1, dropElement1).perform
sleep 2;

@driver.action.drag_and_drop_by(dropElement1, 100, -200).perform
sleep 2;

@driver.find_element(:class, "icon-grid").click
sleep 2;

@driver.find_element(:css, "div.page_nav_btn.btn2").click
sleep 2;
@driver.find_element(:css, "div.page_nav_btn.btn3").click
sleep 2;
@driver.find_element(:css, "div.page_nav_btn.btn1").click
sleep 2;
@driver.find_element(:css, "#welcome > div").click
sleep 2;
@driver.find_element(:css, "button.icon-search").click
sleep 2;
@driver.find_element(:id, "search-query").send_keys "Br"
sleep 2;
 @driver.find_element(:id, "search-go").click
end

 def teardown
   @driver.quit
 end

end 


