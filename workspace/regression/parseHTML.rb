#!/usr/bin/env ruby
require 'rubygems'

require 'colorize'

require 'date'
require 'nokogiri'
require 'open-uri'

url = "http://www.oprah.com/"

doc = Nokogiri::HTML(open(url))
 doc.xpath('//comment()').each do |a_tag|
   puts a_tag.content
   end 
