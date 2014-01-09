#!/usr/bin/env ruby
#
require 'rubygems'
#
require 'watir-webdriver'
require 'colorize'
require './html/html'
#
##*************************************************************************************************************************
##  *** If you run ito issues , please clear cache on the browser and 'unfollow the event' especially if you run second time
##  *** I created the account manually first time , because if the test need to be repeated then it makes sense to have
##  *** signed up account.
##************************************************************************************************************************** 
##  browser = Selenium::WebDriver.for :chrome
#
browser_type = 'FF'
test_environment = 'Prod'
@html = HTMLReport.new()
@report = @html.createReport('axs site', 'AXS SITE', browser_type)
#
begin
#browser = Watir::Browser.new :chrome
#
#browser = Watir::Browser.new
browser.goto 'http://www.axs.com';
#
test_case = @html.newTestName('Verify Home Page')
test = "check Home page"
#
@html.add_to_report(browser.link(:title, "AXS PAGE").exists?, test, 'PASS: Found AXS home Page', 'FAIL: Cannot find home page')
#
#
browser.link(:id, "myaxs-sign-in").click
#
#
test_case = @html.newTestName('Verify Sigin')
test = 'check signin field'
@html.add_to_report(browser.link(:id, "myaxs-sign-in").exists?, test, 'PASS: Sign in located', 'FAIL: Cannot locate the sign in field')
#
browser.close
puts "Test is now complete".green
#
 @html.finishReport(@report, browser_type, test_environment)
#
 rescue => e
  puts $!
   puts e.backtrace
    @html.finishReport(@report, browser_type, test_environment)
        #~ @browser.close
        end
#        #*********************************************************************************************************************
#        # * Potential issue on test, if it fails to locate My Alert tab, need to clear shReport(@report, browser_type, test_environment)browser , run the test second time which
#        # *may fail under webdriver browser, you need to manually 'unfollow the event', then run the script again
#        #**********************************************************************************************************************
#                                                                                                                                 
#
#                                                                                                                                 :
