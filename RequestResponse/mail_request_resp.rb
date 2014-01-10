require 'rubygems'
require 'time'
require 'mail'

fileName= File.open("/Users/nkrishna/qa/FireFox/Regression/Request-Response/RequestResponse.txt")
  
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
     	to ['George_Domantay@own.tv', 'allqa@own.oprah.com']
 	cc 'Naveen_Krishnan@own.tv'
	from 'naveenowntv@gmail.com'
        subject 'Request Response test complete '
         body 'Please see the attached file for the results
	        200, 301 - good response
		302 - Redrirect to oprah.com
		400, 401, 404, 500 - bad response'
        add_file '/Users/nkrishna/qa/FireFox/Regression/Request-Response/RequestResponse.txt'
end

