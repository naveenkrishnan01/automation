#!/usr/bin/env ruby

require 'rubygems'

require 'mysql'
require 'date'
require 'colorize'

email = 'tomm@yoppmail.com'
email1 = email.to_s
begin
	  db =Mysql.real_connect("chiownsql01.myown.int", "nkrishnan", "@utom@t3", "maui_master")
	#   puts "Server version: " + db.get_server_info
	    puts "CONNECTION SUCCESSFUL"

        puts "Starting Time now #{Time.now}".cyan
             puts 'Auth-id' + '   ' + 'Email' + '                 ' + 'harpo-user' + '  ' + 'password'
	   # ts = db.query "SELECT * from maui_cluster1.media_comment order by created_dts desc limit 3"
	     puts "#{email1}"
	    ts = db.query "SELECT auth_id, email, harpo_user, password from maui_master.auth where email = '#{email1}'"
       # Loop thru the rows
	    ts.each_hash do |row|
	      puts row['auth_id'] + " " + row ['email'] + " " + row['harpo_user'] + "   " + row['password']
	    end
      
        puts "End Time now #{Time.now}".cyan	    

rescue Mysql::Error => e
	  puts "Error code: #{e.errno}"
	    puts "Error message: #{e.error}"
	      puts "Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")
ensure
	  db.close if db
end
