require 'rubygems'
require 'time'
require 'mail'

fileName= File.open("/Users/nkrishna/qa/FireFox/output.txt")
  
  begin
    File.exists?(fileName)
       fileName.close
  end     

options = { :address => "smtp.gmail.com",
	    :port => 587,
            :domain => 'gmail.com',       
            :user_name => 'naveenkrishnan01@gmail.com',
            :password => 'jamesbond009',
	    :authentication => 'plain',
	    :enable_starttls_auto => true }



Mail.defaults do
delivery_method :smtp, options
end


Mail.deliver do
     	to 'Naveen_Krishnan@own.tv'
	from 'naveenkrishnan01@gmail.com'
        subject 'Automation Regression Complete '
         body File.read('output.txt')
        add_file '/Users/nkrishna/qa/FireFox/output.txt'
	add_file '/Users/nkrishna/workspace/test/register.png'
end

