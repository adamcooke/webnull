$:.unshift(File.expand_path('../lib', __FILE__))
require 'webnull/server'
run Webnull::Server.new
