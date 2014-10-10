$: << File.join(File.dirname(__FILE__), 'lib')

require_relative 'env'
require 'alephant/harness/setup'
require 'yaml'

schema_base_path = File.join(File.dirname(__FILE__), 'schema')

task :harness do
  config = {
    :tables => [
      { :name => 'client', :schema => YAML::load_file(File.join(schema_base_path, 'client.yaml')) },
      { :name => 'request', :schema => YAML::load_file(File.join(schema_base_path, 'request.yaml')) },
      { :name => 'title', :schema => YAML::load_file(File.join(schema_base_path, 'title.yaml')) }
    ]
  }
  Alephant::Harness::Setup.configure(config, ENV)
end
