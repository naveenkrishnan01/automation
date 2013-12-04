require 'rubygems'
require 'time'
require 'mail'

fileName= File.open("./device_output.txt")
  
  begin
    File.exists?(fileName)
       fileName.close
  end     

options = { :address => "smtp.gmail.com",
	    :port => 587,
            :domain => 'gmail.com',       
            :user_name => 'username@gmail.com',
            :password => 'password',
	    :authentication => 'plain',
	    :enable_starttls_auto => true }



Mail.defaults do
delivery_method :smtp, options
end


Mail.deliver do
#     	to recepient_email 
 	cc 'Naveen_Krishnan@own.tv'
	from 'senders mail'
        subject 'Automation Device Regression Complete. Script name: run-device-script '
         body 'Daily Regression for device
	 Please check the output file for the results which states the device it was run in production
	 The user agent that is supported thru scripts are 
	 Ipad, Iphone, Andriod_phone, Android_tablet
	 The most number of user agent is supported by Chrome browser so this test is run on Chrome '
        add_file './device_output.txt'
end

