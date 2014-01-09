require 'watir-webdriver'
require 'selenium-webdriver'

module BrowseEnvCheckable
  def browsecheck(browser)
	browser = ARGV[0]
    if browser == ''
	browser = 'ff'
    elsif browser == 'chrome'
        browser = 'chrome'
    elsif browser == 'ff'
        browser = 'ff'	    
    end	
   end

  def EnvCheck(env)
       env = ARGV[1]
       if env == 'prod'
	  env = 'prod'
        elsif env == 'betastg'
          env = 'betastg'
	elsif env == 'livestg'
          env = 'livestg'
        else
          env = 'prod'		
       end	  
  end

  def browseEnv(name)
     name = ARGV[0]
     env1 = 
     if name == 'chrome'
       browser = Watir::Browser.new :chrome 
     elsif name == 'ff'  
       browser = Watir::Browser.new
     else
       browser = Watir::Browser.new
     end 
  end 
  
  def ReadFile(filename)
    @filename = filename.to_s 
  end

  def click_sites(url)
   @url = url
   total = 0
   url.each do|t|
     t.total += total
   end
  end
end
