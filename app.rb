require 'sinatra'
require 'sinatra/reloader'
require './lib/dealership'
require './vehicle/lib/vehicle'

get '/' do
  erb :index
end
