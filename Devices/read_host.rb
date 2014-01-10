#!/usr/bin/env ruby
require 'pry'
require 'rubygems'
require 'date'
require 'colorize'

t = File.open("/etc/hosts")

a = t.readlines
puts a[48]
puts a[49]

  f = File.open('device_output.txt', 'a')


  if a[48].to_s == "#4.30.9.22   www.oprah.com\n"  || a[49].to_s == "#4.30.9.33  myown.oprah.com\n"
    puts "This test is not running origin".green
    f.puts "This test is not running origin"
    f.puts a[48]
    f.puts ' '
  elsif a[48].to_s == "4.30.9.22   www.oprah.com\n" || a[49].to_s == "4.30.9.33  myown.oprah.com\n" 
    puts "This test is running origin".green
    f.puts "This test is running origin"
    f.puts a[48]
    f.puts ' '
  else
    puts "please check /etc/hosts file".green
    f.puts "please check /etc/hosts file"
  end





