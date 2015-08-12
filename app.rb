require 'sinatra'
require 'sinatra/reloader'
require './lib/dealership'
require './vehicle/lib/vehicle'

get '/' do
  erb :index
end

get '/dealerships' do
  erb :dealerships
end

get '/dealerships/new' do
  erb :dealerships_form
end
