require 'sinatra/base'
require 'sinatra/reloader'
require './lib/accounts'

class BnbManager < Sinatra::Base

  enable :sessions

  configure :development do 
    register Sinatra::Reloader 
  end

  get '/' do
    erb :index
  end

  post '/' do 
    Accounts.create(first_name: params[:first_name], second_name: params[:second_name], 
    username: params[:username], password: params[:password], email: params[:email], 
    country: params[:country], number: params[:number])
    session[:username] = params[:username]
    redirect '/welcome'
  end

  get '/login' do
    erb :login
  end

  get '/welcome' do 
    @username = session[:username]
    erb :welcome 
  end

  run! if app_file == $0
end