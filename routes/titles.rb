class Titles < Sinatra::Base

  get '/titles' do
    mustache :titles
  end

end
