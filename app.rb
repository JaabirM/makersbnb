require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './lib/rooms'

class Makersbnb < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Testing...'
  end

  get '/rooms' do
    @list = Rooms.list_all
    erb :rooms
  end

  run! if app_file == $0
end