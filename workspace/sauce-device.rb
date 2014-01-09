require 'rubygems'
require "test/unit"
require 'selenium-webdriver'
require 'rest_client'

class ExampleTest < Test::Unit::TestCase
	    def setup
           caps = Selenium::WebDriver::Remote::Capabilities.chrome
           caps.version = "31"
           caps.platform = "Windows 8.1"
	 #  caps['device-type'] = "tablet"
	 #  caps['device-orientation'] = 'potrait'
           caps[:name] = "Testing Home tabs with Windows 8 and Chrome "
          @status = "false"
   	   @driver = Selenium::WebDriver.for(
           :remote,
           :url => "http://naveen1kris1:2062dca8-719e-4018-ad35-fdd2e7ad07ef@ondemand.saucelabs.com:80/wd/hub",
           :desired_capabilities => caps)
          
	   #job-id is the session-id
           @session_id = @driver.instance_variable_get("@bridge").instance_variable_get("@session_id")	   
     	    end
 
     	    def test_sauce
             @driver.get "http://www.oprah.com"
             assert @driver.title.include?("Oprah Winfrey's Official Website - Live Your Best Life - Oprah.com")

            sleep 3;

	     @driver.find_element(:link_text, 'Spirit').click;
	     sleep 2;
 	   @driver.find_element(:link_text, 'Health').click;
	     sleep 2;
           @driver.find_element(:link_text, 'Fashion & Beauty').click;
	      sleep 2;
	   @driver.find_element(:link_text, 'Books').click;
	      sleep 2;
	   @driver.find_element(:link_text, 'Food').click;
	      sleep 2;
	   @driver.find_element(:link_text, 'Entertainment').click;
	    sleep 3;
	    @status = "true"
       end

          # check for pass/fail of the test - REST Json API used as shown below 
	  
	    def teardown
              if  @status == "false"
                RestClient.put("https://naveen1kris1:2062dca8-719e-4018-ad35-fdd2e7ad07ef@saucelabs.com/rest/v1/naveen1kris1/jobs/#{@session_id}", {"passed" => false}.to_json, {:content_type => "application/json"})
	      else
                RestClient.put("https://naveen1kris1:2062dca8-719e-4018-ad35-fdd2e7ad07ef@saucelabs.com/rest/v1/naveen1kris1/jobs/#{@session_id}", {"passed" => true}.to_json, {:content_type => "application/json"})	  
              end
	      @driver.quit
            end
 end

       

    

