require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/flash'
require './lib/accounts'
require './lib/rooms'
require './lib/list_room'
require './lib/account_info'
require './lib/booking'

class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

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
    @username = session[:logged_in]
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
    @username = session[:logged_in] #session variable already contains username, so we use instance variable to show up on the page.
    #Account_Info.get_account_info(2)['username']

    @room_list = List_Room.my_rooms(2)
    erb :account_info
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    if Accounts.details_match?(params[:username], params[:password]) == true
      flash[:notice] = 'You have been logged in'
      session[:logged_in] = params[:username]
      session[:booked_in] = params[:username]
      redirect '/rooms'
    else
      flash[:notice] = 'Invalid credentials'
      redirect '/login'
    end
  end
  
  get '/book_room' do
    @username = session[:logged_in]
    @room_name = params[:room_name]
    erb :book_room
  end

  post '/request_room' do
    Booking.create_booking(params[:username], params[:booked_date_from], params[:booked_date_to])
    redirect 'request_complete'
  end

  get '/request_complete' do
    erb :room_booked
  end
  
  get '/style_test' do
    erb :style_test
  end

  run! if app_file == $0
end