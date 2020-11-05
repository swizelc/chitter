require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/chitter_board'
require_relative 'lib/user'
require_relative 'lib/database_connection_setup'
class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/peeps' do
    if User.check_login(username: params[:username], password: params[:password])
      session[:username] = params[:username]
      redirect '/chitter_board'
    else
      flash[:notice] = 'Incorrect username or password!'
      redirect '/'
    end
  end

  # Post for creating new account
  post '/peeps/new_user' do
    if User.create_user(username: params[:username], password: params[:password]) == false 
      flash[:notice] = 'Username taken!'
      redirect '/'
      
    else
      session[:username] = params[:username]
      redirect '/chitter_board'
    end

  end

  
  get '/chitter_board' do 
    @user = User.find_user(id: User.current_user)
    @peeps = Chitter_board.all
    erb :chitter_board
  end

  get '/add_peep' do 
    erb :add_peep
  end 

  post '/add_peep' do
    user = User.find_user(id: User.current_user)
    peep = params[:peep] + " -- #{user.username}"
    Chitter_board.add(peep: peep, user_id: User.current_user)
    redirect '/chitter_board'
  end  

  delete '/peeps/:id' do
    Chitter_board.delete(id: params[:id])
    redirect '/chitter_board'
  end 


end