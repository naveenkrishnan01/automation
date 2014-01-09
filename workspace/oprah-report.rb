#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
#require './checkArg'
require 'date'
require 'json'
require './html/html'


configuration = JSON.parse(File.read('./conf.json'))
url = configuration["url"]
browser_type = configuration["browser_type"]
count_text = 0;
puts "Starting Time now #{Time.now}"

#if configuration["browser_type"] == "Firefox"
browser_type = 'firefox'
#browser = 'firefox`'  
#else
#browser_type = 'Chrome'
#end  
test_environment = 'Prod'

@html = HTMLReport.new()
@report = @html.createReport('Oprah Home Page', 'Oprah.com', browser_type)

begin
browser = Watir::Browser.new
browser.goto url;
browser.cookies.clear

test_case = @html.newTestName('Verify Oprah Home Page')
test = "check Home Page"

f = File.open('output.txt', 'w')
f.puts "open the file"
browser.text.include? 'Welcome to Oprah.com'
if true
puts "Found the Oprah Home page".yellow
count_text += 1
else
 puts "Having problems"
end
@html.add_to_report(browser.div(:text, "Welcome to Oprah.com").exists?, test, 'PASS: Found on Oprah Home Page', 'FAIL: Cannot find home page')
browser.close

@html.finishReport(@report, browser_type, test_environment)

puts " Test is now complete ".green
f.puts "Test is now complete "
f.puts "Total count for text validation on the page: #{count_text}"
f.puts "Ending time now #{Time.now}"
f.close

rescue => e
 puts $!
puts e.backtrace
@html.finishReport(@report, browser_type, test_environment)
end
