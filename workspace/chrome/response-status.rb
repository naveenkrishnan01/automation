require 'rubygems'

require 'colorize'

require 'net/https'
require "uri"
require "date"


puts "Starting Time now #{Time.now}".cyan

    begin
     url = 'http://www.oprah.com'
       res = Net::HTTP.get_response(URI.parse(url.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url}".green
       else
         puts res.code + " "  + "Issue with the url : #{url}".red	       
       end
        rescue => e
	 puts "Invalid URL #{e} + ' ' + #{url}".red	
       end 

     begin  
     url1 = 'http://www.oprah.com/own-oprahs-next-chapter/oprahs-next-chapter.html'
       res = Net::HTTP.get_response(URI.parse(url1.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url1}".green
       else
         puts res.code + " "  + "Issue with the url : #{url1}".red
       end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url1}".red
       end

     begin  
     url2 = 'http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass.html'
       res = Net::HTTP.get_response(URI.parse(url2.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url2}".green
       else
         puts res.code + " "  + "Issue with the url : #{url2}".red	       
      end
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url2}".red
      end


      begin 
     url3 = 'http://www.oprah.com/own'
        res = Net::HTTP.get_response(URI.parse(url3.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url3}".green
       else
         puts res.code + " "  + "Issue with the url : #{url3}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url3}".red
      end
       
     begin
     url4 = 'http://www.oprah.com/own-iyanla-fix-my-life/iyanla-social-buzz.html'
        res = Net::HTTP.get_response(URI.parse(url4.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url4}".green
       else
         puts res.code + " "  + "Issue with the url : #{url4}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url4}".red
    end

       begin
       url5 = 'http://www.oprah.com/own-iyanla-fix-my-life/iyanla-fix-my-life.html'
        res = Net::HTTP.get_response(URI.parse(url5.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url5}".green
       else
         puts res.code + " "  + "Issue with the url : #{url5}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url5}".red
    end	     
        
       begin
       url6 = 'http://www.oprah.com/own-iyanla-fix-my-life/iyanla-fix-my-life-episodes.html'
        res = Net::HTTP.get_response(URI.parse(url6.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url6}".green
       else
         puts res.code + " "  + "Issue with the url : #{url6}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url6}".red
    end	     
        
       begin
       url7 = 'http://www.oprah.com/own-iyanla-fix-my-life/iyanla-fix-my-life-videos.html'
        res = Net::HTTP.get_response(URI.parse(url7.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url7}".green
       else
         puts res.code + " "  + "Issue with the url : #{url7}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url7}".red
    end	     
        
       begin
       url8 = 'http://www.oprah.com/own-iyanla-fix-my-life/the-work.html'
        res = Net::HTTP.get_response(URI.parse(url8.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url8}".green
       else
         puts res.code + " "  + "Issue with the url : #{url8}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url8}".red
    end	     
        
       begin
       url9 = 'http://www.oprah.com/packages/owners.html'
        res = Net::HTTP.get_response(URI.parse(url9.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url9}".green
       else
         puts res.code + " "  + "Issue with the url : #{url9}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url9}".red
    end	     
        
       begin
       url10 = 'http://www.oprah.com/packages/video-page.html'
        res = Net::HTTP.get_response(URI.parse(url10.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url10}".green
       else
         puts res.code + " "  + "Issue with the url : #{url10}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url10}".red
    end	     
        
       begin
       url11 = 'http://www.oprah.com/owners/OWNers-Events'
        res = Net::HTTP.get_response(URI.parse(url11.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url11}".green
       else
         puts res.code + " "  + "Issue with the url : #{url11}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url11}".red
    end	     
        
       begin
       url12 = 'http://www.oprah.com/packages/engage.html'
        res = Net::HTTP.get_response(URI.parse(url12.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url12}".green
       else
         puts res.code + " "  + "Issue with the url : #{url12}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url12}".red
    end	     
        
       begin
       url13 = 'http://www.oprah.com/packages/social.html'
        res = Net::HTTP.get_response(URI.parse(url13.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url13}".green
       else
         puts res.code + " "  + "Issue with the url : #{url13}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url13}".red
    end	     
        
       begin
       url14 = 'http://www.oprah.com/packages/blog.html'
        res = Net::HTTP.get_response(URI.parse(url14.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url14}".green
       else
         puts res.code + " "  + "Issue with the url : #{url14}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url14}".red
    end	     
        
       begin
       url15 = 'http://www.oprah.com/owners/About-OWNers-Frequently-Asked-Questions'
        res = Net::HTTP.get_response(URI.parse(url15.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url15}".green
       else
         puts res.code + " "  + "Issue with the url : #{url15}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url15}".red
    end	     
        
       begin
       url16 = 'http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass-videos.html'
        res = Net::HTTP.get_response(URI.parse(url16.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url16}".green
       else
         puts res.code + " "  + "Issue with the url : #{url16}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url16}".red
    end	     
    
       begin
       url17 = 'http://www.oprah.com/oprahs-lifeclass/oprahs-lifeclass-classes.html'
        res = Net::HTTP.get_response(URI.parse(url17.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url17}".green
       else
         puts res.code + " "  + "Issue with the url : #{url17}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url17}".red
    end	     
    
       begin
       url18 = 'http://www.oprah.com/oprahs-lifeclass/life-work.html'
        res = Net::HTTP.get_response(URI.parse(url18.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url18}".green
       else
         puts res.code + " "  + "Issue with the url : #{url18}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url18}".red
    end	     
    
       begin
       url19 = 'http://www.oprah.com/oprahs-lifeclass/webcast-landing.html'
        res = Net::HTTP.get_response(URI.parse(url19.to_s))
       if res.code == '200' || res.code ==  '301'
	 puts res.code + "  " + "Looking good for url : #{url19}".green
       else
         puts res.code + " "  + "Issue with the url : #{url19}".red	       
      end 
       rescue => e
        puts "Invalid URL #{e} + ' ' + #{url19}".red
    end	     
     
 puts "End Time now #{Time.now}".cyan      

