#!/usr/bin/env ruby

require 'rubygems'

class ReqRespEnv
end

def environ(env1)
  if env1 == 'prod'
      ARGV[0] = 'prod'
  elsif
     env1 == 'testserver'
      ARGV[0] = 'testserver'
  elsif
      env1 == 'betastg' 
       ARGV[0] = 'betastg'
  else
       ARGV[0] = 'prod'
  end
end


