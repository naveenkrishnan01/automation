require 'rubygems'
require 'time'
require 'mail'

fileName= File.open("./output1.txt")
  
  begin
    File.exists?(fileName)
       fileName.close
  end     

options = { :address => "smtp.gmail.com",
	    :port => 587,
            :domain => 'gmail.com',       
            :user_name => 'qaoprahown@gmail.com',
            :password => 'oprahrules99',
	    :authentication => 'plain',
	    :enable_starttls_auto => true }



Mail.defaults do
delivery_method :smtp, options
end


Mail.deliver do
     	to ['George_Domantay@own.tv','allqa@own.oprah.com']
 	cc 'Naveen_Krishnan@own.tv'
	from 'qaoprahown@gmail.com'
        subject 'Automation Regression for Registration Complete. script name:- run-REG-ocom-own-site-registration.rb'
         body 'REGRESSION COMPLETE FOR REGISTRATION, please verify the output for browser and environment'
        add_file :filename => 'output1.txt', :content => File.read('./output1.txt')
	add_file :filename => 'After-Omag-Finish.png', :content => File.read('./After-Omag-Finish.png')
	add_file :filename => 'before-Omag-Finish.png', :content => File.read('./before-Omag-Finish.png')
	add_file :filename => 'Newsletter-Finish.png', :content => File.read('./Newsletter-Finish.png')
	
end

