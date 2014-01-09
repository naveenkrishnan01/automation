require 'rubygems'
require 'time'
require 'mail'

fileName= File.open("/Users/nkrishna/qa/FireFox/Regression/Sharebar/sharebar.txt")
  
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
#    	to ['George_Domantay@own.tv', 'allqa@own.oprah.com', 'David_Kwong@own.tv']
 	cc 'Naveen_Krishnan@own.tv'
	from 'naveenowntv@gmail.com'
        subject 'Automation for ShareBar Regression Complete '
         body 'Please add the domain name in front of the URL to verify manually just in case.All the url that were verified is in the output file
	 For ex:- for Prod, Livestg it is www.oprah.com and for betastg - betastg.oprah.com
	 Please check the output file for the results which also includes the browser and environment it was run'
        add_file '/Users/nkrishna/qa/FireFox/Regression/Sharebar/sharebar.txt'
        add_file '/Users/nkrishna/qa/FireFox/Regression/Sharebar/Facebook-like.png'
        add_file '/Users/nkrishna/qa/FireFox/Regression/Sharebar/GooglePlus.png'
        add_file '/Users/nkrishna/qa/FireFox/Regression/Sharebar/twitter.png'
        add_file '/Users/nkrishna/qa/FireFox/Regression/Sharebar/printIcon-JaneFonda.png'
end

