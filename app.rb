require 'sinatra/base'
require 'mustache/sinatra'
require 'securerandom'

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

  get '/clients' do
    mustache :clients
  end

  get '/clients/create' do
    mustache :clients_create
  end

  post '/clients/create' do
    ddb = AWS::DynamoDB::Client.new(:api_version => '2012-08-10')
    ddb.put_item(
      :table_name => 'client',
      :item => {
        'company' => {
          'S' => params[:company]
        },
        'buyer' => {
          'S' => params[:buyer]
        },
        'teritory' => {
          'S' => params[:teritory]
        }
      }
    )
    redirect('/clients')
  end

  get '/requests' do
    mustache :requests
  end

  get '/requests/create' do
    mustache :requests_create
  end

  post '/requests/create' do
    ddb = AWS::DynamoDB::Client.new(:api_version => '2012-08-10')
    ddb.put_item(
      :table_name => 'request',
      :item => {
        'id' => {
          'S' => SecureRandom.uuid
        },
        'title' => {
          'S' => params[:title]
        },
        'client' => {
          'S' => params[:client]
        },
        'comment' => {
          'S' => params[:comment]
        }
      }
    )
    redirect('/requests')
  end




end
