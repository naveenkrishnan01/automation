#!/usr/bin/env ruby

require 'rubygems'
require 'uri'

#*** This matches only words and not numbers.

 word = %w/hello joe 1234 www.oprah.com/

 pattern = /\D[a-z]*/

word.each do |check|

if check.match pattern
   puts "#{check} matches"
else
   puts "#{check} does not match"  	
end   
end






