require 'sinatra/base'
require 'mustache/sinatra'

class Application < Sinatra::Base
  register Mustache::Sinatra
  require 'views/layout'

  set :mustache, {
    :views     => 'views/',
    :templates => 'templates/'
  }

  get '/' do
    mustache :index
  end

  get '/titles' do
    mustache :titles
  end

  get '/titles/create' do
    mustache :titles_create
  end

  post '/titles/create' do
    ddb = AWS::DynamoDB::Client.new(:api_version => '2012-08-10')
    ddb.put_item(
      :table_name => 'title',
      :item => {
        'name' => {
          'S' => params[:titleName]
        }
      }
    )
    redirect('/titles')
  end
end
