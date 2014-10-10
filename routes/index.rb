require_relative '../app'

class Index < Application

  get '/' do
    mustache :index
  end

end
