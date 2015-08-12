class Dealership
  attr_reader :name, :id, :cars
  @@dealerships = []

  def initialize(name)
    @name = name
    @id = @@dealerships.length + 1
    @cars = []
  end

end
