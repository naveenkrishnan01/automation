#!/usr/bin/env ruby
require 'rubygems'
require 'colorize'
require './req-resp-env.rb'

class RunReqResp < ReqRespEnv
end	

@env1 = ARGV[0]
env_check = environ(@env1)

if env_check == 'betastg'
  name  = 'BETASTG'
elsif env_check == 'testserver'
  name  = 'TEST SERVER'
 else
   name = 'PRODUCTION'
 end

require '../FileVerify.rb';

f = File.open('RequestResponse.txt', 'a')

puts "** THIS REQUEST RESPONSE TEST IS DONE IN  #{name} ENVIRONMENT **".green
f.puts "** THIS REQUEST RESPONSE TEST IS DONE IN  #{name} ENVIRONMENT **"
f.puts ' '
f.close

require './article-page-type.rb';
require './video-regression.rb';
require './old-styled.rb';
require './Microsite.rb';
require './modular.rb';
require './tv-show-sites.rb';
require './IynalaLifeClass.rb';
require './mail_request_resp.rb'
