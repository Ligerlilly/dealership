require 'rspec'
require './lib/dealership'
require './vehicle/lib/vehicle'

describe Dealership do
  before do
    Dealership.clear
    @test_dealership = Dealership.new("Bob's Used Cars")
  end

  describe '#name' do
    it 'returns name of dealership' do
      expect(@test_dealership.name).to eq "Bob's Used Cars"
    end
  end

  describe '#id' do
    it 'returns id of dealership' do
      expect(@test_dealership.id).to eq 1
    end
  end

  describe '#cars' do
    it 'returns an empty array of cars for the dealership' do
      expect(@test_dealership.cars).to eq []
    end
  end

  describe '#save' do
    it 'adds a dealership to the array of saved dealerships' do
      @test_dealership.save
      expect(Dealership.all).to eq [@test_dealership]
    end
  end

  describe '.clear' do
    it 'empties out all the saved dealerships' do
      Dealership.clear
      expect(Dealership.all).to eq []
    end
  end

  describe '.find' do
    it 'returns a dealership by its id number' do
      @test_dealership.save
      test_dealership2 = Dealership.new("Jane's Cars")
      test_dealership2.save
      expect(Dealership.find(@test_dealership.id)).to eq @test_dealership
    end
  end

  describe '#add_vehicle' do
    it 'adds a new vehicle to a dealership' do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      @test_dealership.add_vehicle(test_vehicle)
      expect(@test_dealership.cars).to eq [test_vehicle]
    end
  end
end
