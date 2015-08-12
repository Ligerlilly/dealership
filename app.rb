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

post '/dealerships' do
  dealership = Dealership.new(params['dealership'])
  dealership.save
  erb :dealerships
end

get '/clear' do
  Dealership.clear
  erb :dealerships
end

get '/dealerships/:id' do
  @dealership = Dealership.find(params['id'].to_i)
  erb :dealership
end

get '/dealerships/:id/vehicles/new' do
  @dealership = Dealership.find(params['id'].to_i)
  erb :dealership_vehicles_form
end

post '/vehicles' do
  @dealership = Dealership.find(params['dealership_id'].to_i)
  @dealership.add_vehicle(Vehicle.new(params['make'], params['model'], params['year']))
  @dealership.cars.each do |car|
    car.save
  end

  erb :dealership
end

get '/vehicles/:id' do
  @car = Vehicle.find(params['id'].to_i)
  erb :vehicle
end
