#!/usr/bin/env ruby

require 'rubygems'
require 'date'
require 'colorize'
require 'open-uri'

require 'watir-webdriver'

client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 180 # seconds – default is 60


b = Watir::Browser.new :phantomjs, :http_client => client

puts "Starting Time now #{Time.now}".cyan

puts "**** Article Page Types URL ******".green

 b.goto "http://www.oprah.com/health/100-Pounds-Before-and-After"
 begin
 open "http://www.oprah.com/health/100-Pounds-Before-and-After"
  puts b.title + " " +  "http://www.oprah.com/health/100-Pounds-Before-and-After".green
  rescue => e
     puts "Invalid URL #{e}"
     puts "100 pounds before and after - url 1".red
 end

 b.goto "http://www.oprah.com/oprahdotcom/In-th-Green-Room-With-Pink" 
 begin
 open "http://www.oprah.com/oprahdotcom/In-th-Green-Room-With-Pink"
  puts b.title + " " +  "http://www.oprah.com/oprahdotcom/In-th-Green-Room-With-Pink".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "In the green room with pink - url 2".red
 end

 b.goto "http://www.oprah.com/oprahshow/Fran-Drescher-and-Peter-Jacobson/5"
 begin
 open "http://www.oprah.com/oprahshow/Fran-Drescher-and-Peter-Jacobson/5"
   puts b.title + " " + "http://www.oprah.com/oprahshow/Fran-Drescher-and-Peter-Jacobson/5".green
  rescue => e
   puts "Invalid URL #{e}" 
   puts "What brought Fran D and Peter J together - url 3".red 
 end

 b.goto "http://www.oprah.com/spirit/Jane-Fondas-Daughter-Visits-Her-Biological-Family"
 begin
 open "http://www.oprah.com/spirit/Jane-Fondas-Daughter-Visits-Her-Biological-Family"
   puts b.title + " " + "http://www.oprah.com/spirit/Jane-Fondas-Daughter-Visits-Her-Biological-Family".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Jane Fonda daughter visit biological family - url 4".red
 end
 
 b.goto "http://www.oprah.com/food/Top-Chef-Masters-Susan-Feniger-Talks-About-Her-Love-of-Street-Food_1"
 begin
 open "http://www.oprah.com/food/Top-Chef-Masters-Susan-Feniger-Talks-About-Her-Love-of-Street-Food_1"
   puts b.title + " " + "http://www.oprah.com/food/Top-Chef-Masters-Susan-Feniger-Talks-About-Her-Love-of-Street-Food_1".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Top chef Master susan F talks about her love for street food - url 5".red
 end
 
 b.goto "http://www.oprah.com/oprahradio/Why-Chinese-Mothers-Are-Superior-Audio"
 begin
 open "http://www.oprah.com/oprahradio/Why-Chinese-Mothers-Are-Superior-Audio"
   puts b.title + " " + "http://www.oprah.com/oprahradio/Why-Chinese-Mothers-Are-Superior-Audio".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Why chinese mother are superior audio - url 6".red
 end
 

 b.goto "http://www.oprah.com/food/Throw-a-Halloween-Cocktail-Party"
  begin 
  open "http://www.oprah.com/food/Throw-a-Halloween-Cocktail-Party"
   puts b.title + " " + "http://www.oprah.com/food/Throw-a-Halloween-Cocktail-Party".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "How to throw Halloween cocktail party - url 7".red
 end
 
b.goto "http://www.oprah.com/food/Pub-Fare-Menu"
  begin
   open "http://www.oprah.com/food/Pub-Fare-Menu"
    puts b.title + " " + "http://www.oprah.com/food/Pub-Fare-Menu".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Pub Fare menu - url 8".red
 end
 
b.goto "http://www.oprah.com/relationships/How-We-Met_2"
 begin
  open "http://www.oprah.com/relationships/How-We-Met_2"
  puts b.title + " " + "http://www.oprah.com/relationships/How-We-Met_2".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Couples talk about how they met - url 9".red
 end
 

b.goto "http://www.oprah.com/style/How-to-Find-Your-Own-Style"
  begin   
 open "http://www.oprah.com/style/How-to-Find-Your-Own-Style"
  puts b.title + " " + "http://www.oprah.com/style/How-to-Find-Your-Own-Style".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "How to Find your own style - url 10".red
 end
 
  b.goto "http://www.oprah.com/relationships/Denzel-Jerry-Barbra-and-More-Celebrities-Talk-Love"
  begin
   open "http://www.oprah.com/relationships/Denzel-Jerry-Barbra-and-More-Celebrities-Talk-Love"
   puts b.title + " " + "http://www.oprah.com/relationships/Denzel-Jerry-Barbra-and-More-Celebrities-Talk-Love".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Denzyl, Jerry, Barbara and more celebrities talk love - url 11".red
 end
 
 b.goto "http://www.oprah.com/style/The-Best-February-2011-Beauty-Products"
   begin
  open "http://www.oprah.com/style/The-Best-February-2011-Beauty-Products"
   puts b.title + " " + "http://www.oprah.com/style/The-Best-February-2011-Beauty-Products".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Oprah style best of February 2011 Beauty Products - url 12".red
 end

  b.goto "http://www.oprah.com/food/What-Do-You-Want-to-Eat"
   begin
 b.goto "http://www.oprah.com/food/What-Do-You-Want-to-Eat"
   puts b.title + " " + "http://www.oprah.com/food/What-Do-You-Want-to-Eat".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "What do you want to eat? - url 13".red
 end

 b.goto "http://www.oprah.com/oprahsbookclub/Oprahs-Book-Club_3"
   begin
  open "http://www.oprah.com/oprahsbookclub/Oprahs-Book-Club_3"
   puts b.title + " " + "http://www.oprah.com/oprahsbookclub/Oprahs-Book-Club_3".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Steinbeck goes back to movies - url 14".red
 end

 b.goto "http://www.oprah.com/oprahsbookclub/Take-the-Love-In-the-Time-of-Cholera-Quiz"
   begin
  open "http://www.oprah.com/oprahsbookclub/Take-the-Love-In-the-Time-of-Cholera-Quiz"
   puts b.title + " " + "http://www.oprah.com/oprahsbookclub/Take-the-Love-In-the-Time-of-Cholera-Quiz".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Take the love time of cholera quiz - url 15".red
 end

 b.goto "http://www.oprah.com/money/Suze-Ormans-Quiz-Are-You-Filling-the-Void-by-Overspending"
   begin
  open "http://www.oprah.com/money/Suze-Ormans-Quiz-Are-You-Filling-the-Void-by-Overspending"
   puts b.title + " " + "http://www.oprah.com/money/Suze-Ormans-Quiz-Are-You-Filling-the-Void-by-Overspending".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Suze Orman quiz: Are you filling the void by overspending - url 16".red
 end

 b.goto "http://www.oprah.com/relationships/Quiz-What-Women-Can-Learn-from-Men_1"
   begin
  open "http://www.oprah.com/relationships/Quiz-What-Women-Can-Learn-from-Men_1"
   puts b.title + " " + "http://www.oprah.com/relationships/Quiz-What-Women-Can-Learn-from-Men_1".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Quiz: What women can learn from men - url 17".red
 end

 b.goto "http://www.oprah.com/food/Frozen-Yogurt-Banana-Pops"
   begin
  open "http://www.oprah.com/food/Frozen-Yogurt-Banana-Pops"
   puts b.title + " " + "http://www.oprah.com/food/Frozen-Yogurt-Banana-Pops".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Frozen yougurt banana pops - url 18".red
 end

 b.goto "http://www.oprah.com/food/Crab-Cake-Sliders-with-Spicy-Mayo"
   begin
  open "http://www.oprah.com/food/Crab-Cake-Sliders-with-Spicy-Mayo"
   puts b.title + " " + "http://www.oprah.com/food/Crab-Cake-Sliders-with-Spicy-Mayo".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Crab cake slider with Spicy Mayo - url 19".red
 end


 b.goto "https://www.oprah.com/world/A-Costa-Rican-Nature-Retreat-Sweepstakes/1"
   begin
  open "https://www.oprah.com/world/A-Costa-Rican-Nature-Retreat-Sweepstakes/1"
   puts b.title + " " + "https://www.oprah.com/world/A-Costa-Rican-Nature-Retreat-Sweepstakes/1".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "A costa Rican Nature Retreat Sweepstakes - url 20".red
 end

 b.goto "https://www.oprah.com/relationships/Pick-Your-Perfect-Getaway-Sweepstakes/1"
   begin
  open "https://www.oprah.com/relationships/Pick-Your-Perfect-Getaway-Sweepstakes/1"
   puts b.title + " " + "https://www.oprah.com/relationships/Pick-Your-Perfect-Getaway-Sweepstakes/1".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Pick your Perfect Gateway Sweepstakes - url 21".red
 end

 b.goto "https://www.oprah.com/entertainment/The-Oprah-Show-Goes-Hollywood-Sweepstakes_2/1"
   begin
  open "https://www.oprah.com/entertainment/The-Oprah-Show-Goes-Hollywood-Sweepstakes_2/1"
   puts b.title + " " + "https://www.oprah.com/entertainment/The-Oprah-Show-Goes-Hollywood-Sweepstakes_2/1".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "The Oprah Show Goes to Hollywood Sweepstakes - url 22".red
 end

 b.goto "http://www.oprah.com/relationships/Family-and-Fun-at-Your-Fingertips-Sweepstakes-Official-Rules_1"
   begin
  open "http://www.oprah.com/relationships/Family-and-Fun-at-Your-Fingertips-Sweepstakes-Official-Rules_1"
   puts b.title + " " + "http://www.oprah.com/relationships/Family-and-Fun-at-Your-Fingertips-Sweepstakes-Official-Rules_1".green
 rescue => e
     puts "Invalid URL #{e}"
     puts "Family and Fun at Your Fingertips sweepsakes - url 22".red
 end

puts "End Time now #{Time.now}".cyan

b.close
