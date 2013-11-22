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
            :user_name => 'gmail.email'
            :password => 'your password',
	    :authentication => 'plain',
	    :enable_starttls_auto => true }



Mail.defaults do
delivery_method :smtp, options
end


Mail.deliver do
    # 	to ['recepient 1', 'receipeint 2']
 	cc 'your gamil address'
	from 'your gamil address'
        subject 'Automation Regression Complete for Omniture tracking. Scriptname : run-omniture.rb '
         body 'Omniture tracking scripts.
	 Please check the output file which has extracted all the Omniture variables and the pages clicked abd total clicks'
        add_file '/Users/nkrishna/qa/FireFox/Regression/Omniture/output1.txt'
end

