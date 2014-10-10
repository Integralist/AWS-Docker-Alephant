$: << File.join(File.dirname(__FILE__), 'lib')

ENV["APP_ENV"] = ENV.fetch("RACK_ENV", 'development')

require "alephant/harness/aws"
require "spurious/ruby/awssdk/helper"
require "pry" if ENV["APP_ENV"] == "development"

AWS.config(:region => 'eu-west-1')

if ENV['APP_ENV'] == 'development'
  AWS.config(:secret_access_key => 'development_secret', :access_key_id => 'development_access')
  Spurious::Ruby::Awssdk::Helper.configure
  Alephant::Harness::AWS.configure(ENV)
end
