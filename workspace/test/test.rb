#!/usr/bin/env ruby
require 'pry'
require 'rubygems'
require 'date'
require 'colorize'
require 'watir-webdriver'
require 'webdriver-user-agent'

#binding.pry

driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :android_tablet, :orientation => :landscape)
browser = Watir::Browser.new driver
browser.goto 'www.oprah.com'

browser.element(:xpath, ".//*[@id='triptypch_container']/div[3]/a[3]/img").click;
sleep 3;
browser.back;
browser.element(:xpath, ".//*[@id='triptypch_container']/div[3]/a[1]/img").click;
sleep 3;
browser.back;
browser.element(:xpath, ".//*[@id='triptypch_container']/div[3]/a[2]/img").click;
sleep 3;
browser.back;
puts " Test is now complete for carousal on home page".cyan







