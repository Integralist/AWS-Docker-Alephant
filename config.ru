$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'aws-sdk'
require 'dotenv'
require 'app'

ENV['APP_ENV'] = ENV.fetch('APP_ENV', 'development')

if ENV['APP_ENV'] == 'development'
  Dotenv.load(File.join(File.dirname(__FILE__), 'config', 'development', 'env.yaml'))
  require 'spurious/ruby/awssdk/helper'
  Spurious::Ruby::Awssdk::Helper.configure
end

run Application.new
