require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/accounts'
require './lib/rooms'
require './lib/list_room'
require './lib/account_info'

class Makersbnb < Sinatra::Base
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
    
  get '/test' do
    'Testing...'
  end
  
  get '/rooms' do
    @list = Rooms.list_all
    erb :rooms
  end

  get '/list_room' do
    erb :list_room
  end

  post '/list_room' do
    p List_Room.create_room(
    params[:room_name], params[:room_description], 
    params[:price], params[:street],
    params[:apt_suite], params[:city], 
    params[:county], params[:postcode])
    redirect '/rooms'
  end

  get '/account_info' do
    @username = "Jaabir"
    Account_Info.get_account_info(2)
    erb :account_info
  end

  run! if app_file == $0
end