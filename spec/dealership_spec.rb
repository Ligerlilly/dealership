require 'rspec'
require './lib/dealership'

describe Dealership do
  before do
    @test_dealership = Dealership.new("Bob's Used Cars")
  end
  describe '#name' do
    it 'returns name of dealership' do
      expect(@test_dealership.name).to eq "Bob's Used Cars"
    end
  end
end
