require 'rubygems'
require "test/unit"
require 'selenium-webdriver'

class ExampleTest < Test::Unit::TestCase
#	    def setup
#           caps = Selenium::WebDriver::Remote::Capabilities.safari
#           caps.version = "6"
#           caps.platform = "OS X 10.8"
#           caps[:name] = "Testing Hometabs on Windows 8 - chrome - betastg "

           
#   	   @driver = Selenium::WebDriver.for(
#           :remote,
#           :url => "http://naveenowntv:0b1e7c7d-6543-496c-a561-858666f3b81b@ondemand.saucelabs.com:80/wd/hub",
#           :desired_capabilities => caps)
#       end
         def setup
           @driver = Selenium::WebDriver.for :firefox
           @pass_status = "false"
	 end 


	def test_oprah
	  @driver.get 'http://ownaccess:oprah@betamyown.oprah.com/dump.html'
	  @driver.get 'http://ownaccess:oprah@betastg.oprah.com/index.html'
	  sleep 3;
	  @driver.get "http://betastg.oprah.com"
          	  
         @driver.find_element(:link_text, 'Spirit').click;
	 sleep 2;
	 
	 @driver.find_element(:link_text, 'Health1').click;
#	 @driver.find_element(:link_title, 'Relationships').click;
#	 sleep 2;
	 @driver.find_element(:link_text, 'Fashion & Beauty').click;
	 sleep 2;
	 @driver.find_element(:link_text, 'Books').click;
	 sleep 2;
	 @driver.find_element(:link_text, 'Food').click;
	 sleep 2;
	 @driver.find_element(:link_text, 'Entertainment').click;
	 sleep 3;


	  @driver.navigate.back;
	  sleep 3;
       end
           @pass_status = "true"

	    def teardown
             puts "#{@pass_status}"		    
            @driver.quit
      	    end
end


