$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'env'
require 'app'

run Application.new
