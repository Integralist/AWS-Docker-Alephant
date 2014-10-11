$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'aws-sdk'
require 'dotenv'
require 'app'

ENV['APP_ENV'] = ENV.fetch('APP_ENV', 'development')

if ENV['APP_ENV'] == 'development'
  require 'spurious/ruby/awssdk/helper'
  Spurious::Ruby::Awssdk::Helper.configure
end


Dotenv.load(File.join(File.dirname(__FILE__), 'config', ENV['APP_ENV'], 'env.yaml'))

run Application.new
