require 'watir-webdriver'
require 'webdriver-user-agent'

module Deviceable
   def device(name1)
      name1 = ARGV[0]	   
     if name1 == 'ipad'
    driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :ipad, :orientation => :landscape)
     elsif name1 == 'iphone'
	   driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :iphone, :orientation => :landscape)
     elsif name1 == 'android_phone'
    driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :android_phone, :orientation => :landscape)
     elsif name1 == 'android_tablet'
	   driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :android_tablet, :orientation => :landscape)
     else
           driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :android_phone, :orientation => :landscape)
     end
   end
end

    	  
