#!/usr/bin/env ruby

require 'rubygems'

#require 'watir-webdriver'
require 'colorize'
require 'date'
class Test
end	

def downer (string)  
 if string == 'IE'
    ARGV[0] = 'ie'
 else
    ARGV[0] = 'chrome' 	 
end 
end

@string = ARGV[0]  
t = downer(@string)      # -> "hello"  
puts t  
#puts @string       # -> "HELLO"

