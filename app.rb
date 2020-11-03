require 'sinatra/base'

class Blog_App < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end


end