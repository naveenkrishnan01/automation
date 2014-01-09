#!/usr/bin/env ruby
require 'pry'
require 'rubygems'
require 'date'
require 'colorize'

t = File.open("/etc/hosts")

a = t.readlines
puts a[48]
puts a[49]

#binding.pry
if Dir["/Users/nkrishna/workspace/test"]
  puts "open this file"	
f = File.open('output.txt', 'a')
else
  puts "problem finding the file"	
end	
 	
  if a[48].to_s == "#4.30.9.22   www.oprah.com\n"  || a[49].to_s == "#4.30.9.33  myown.oprah.com\n"
    puts "This test is not running origin".green
    f.puts "This test is not running origin"
  elsif a[48].to_s == "4.30.9.22   www.oprah.com\n" || a[49].to_s == "4.30.9.33  myown.oprah.com\n" 
    puts "This test is running origin".green
    f.puts "This test is running origin"
  else
    puts "please check /etc/hosts file".green
    f.puts "please check /etc/hosts file"
  end





