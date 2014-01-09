#!/usr/bin/env ruby
require 'rubygems'
require 'colorize'
require 'date'
require 'mysql'

bh = Mysql.new('10.50.10.186', 'nkrishnan', '@utom@t3', 'maui_master')
 puts "Server version" + dbh.get_server_info + " " + "Connection to database possible".red

