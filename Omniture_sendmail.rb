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
    # 	to ['George_Domantay@own.tv', 'allqa@own.oprah.com']
 	cc 'Naveen_Krishnan@own.tv'
	from 'naveenowntv@gmail.com'
        subject 'Automation Regression Complete for Omniture tracking. Scriptname : run-omniture.rb '
         body 'Omniture tracking scripts.
	 Please check the output file which has extracted all the Omniture variables and the pages clicked abd total clicks'
        add_file './output1.txt'
end

