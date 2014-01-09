#!/usr/bin/env ruby
require 'rubygems'
require 'date'
require 'pry'

module DateTimeable

  def dt
   datetime = Time.now  
   datetime.strftime("%b/%d/%Y %l:%M%P %Z")	
  end	
end
	
