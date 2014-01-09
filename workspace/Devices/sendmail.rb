require 'rubygems'
require 'time'
require 'mail'

fileName= File.open("/Users/nkrishna/qa/FireFox/Regression/Devices/device_output.txt")
  
  begin
    File.exists?(fileName)
       fileName.close
  end     

options = { :address => "smtp.gmail.com",
	    :port => 587,
            :domain => 'gmail.com',       
            :user_name => 'naveenowntv@gmail.com',
            :password => 'oprah009',
	    :authentication => 'plain',
	    :enable_starttls_auto => true }



Mail.defaults do
delivery_method :smtp, options
end


Mail.deliver do
#     	to ['George_Domantay@own.tv', 'allqa@own.oprah.com', 'David_Kwong@own.tv','Ray_Connors@own.tv']
 	cc 'Naveen_Krishnan@own.tv'
	from 'naveenowntv@gmail.com'
        subject 'Automation Regression Complete '
         body 'Automation Regression Complete
	 Please check the output file for the results which states the device it was run in production
	 The user agent that is supported thru scripts are 
	 Ipad, Iphone, Andriod_phone, Android_tablet
	 The most number of user agent is supported by Chrome browser so this test is run on Chrome '
        add_file '/Users/nkrishna/qa/FireFox/Regression/Devices/device_output.txt'
end

