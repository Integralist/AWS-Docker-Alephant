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
    item = {
      'name' => {
        'S' => params[:titleName]
      }
    }

    put_item(item, 'TITLE_TABLE_NAME')
    redirect('/titles')
  end

  get '/clients' do
    mustache :clients
  end

  get '/clients/create' do
    mustache :clients_create
  end

  post '/clients/create' do
    item = {
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

    put_item(item, 'CLIENT_TABLE_NAME')
    redirect('/clients')
  end

  get '/requests' do
    mustache :requests
  end

  get '/requests/create' do
    mustache :requests_create
  end

  post '/requests/create' do
    item = {
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

    put_item(item, 'REQUEST_TABLE_NAME')
    redirect('/requests')
  end

  protected

  def put_item(table_name, item)
    ddb.put_item(
      :table_name => ENV[table_name],
      :item       => item
    )
  end

  def ddb
    @ddb ||= AWS::DynamoDB::Client::V20120810.new
  end
end
