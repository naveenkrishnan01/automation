#!/usr/bin/env ruby

require 'rubygems'
require 'test/unit'
require 'selenium-webdriver'
require 'rest_client'

class Own2 < Test::Unit::TestCase

def setup
 # This used only for Sauce labs
 caps = Selenium::WebDriver::Remote::Capabilities.ie
 caps.version = "10"
 caps.platform = "Windows 7"
 caps[:name] = "Testing own2.0 on Windows 7 and IE10"
 @status = "false"
 @driver = Selenium::WebDriver.for(
  :remote,
  :url => "http://ownqa:66f9ac4a-4fe0-44d3-bddf-4106bd38985e@ondemand.saucelabs.com:80/wd/hub",
  :desired_capabilities => caps)

 #job-id is the session-id
   @session_id = @driver.instance_variable_get("@bridge").instance_variable_get("@session_id")
  #

# The below script used only for local
#@driver = Selenium::WebDriver.for :chrome

end

def test
###############################
# click on the newsletter link
##############################
sleep 3;

@driver.get 'http://o20-dev.oprah.com/'
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
@status = "true" 
end

 def teardown
if  @status == "false"
        RestClient.put("https://http://ownqa:66f9ac4a-4fe0-44d3-bddf-4106bd38985e@saucelabs.com/rest/v1/ownqa/jobs/#{@session_id}", {"passed" => false}.to_json, {:content_type => "application/json"})
else
      RestClient.put("http://ownqa:66f9ac4a-4fe0-44d3-bddf-4106bd38985e@saucelabs.com/rest/v1/ownqa/jobs/#{@session_id}", {"passed" => true}.to_json, {:content_type => "application/json"})
   @driver.quit
 end
end 
end

