class Dealership
  attr_reader :name, :id, :cars
  @@dealerships = []

  def initialize(name)
    @name = name
    @id = @@dealerships.length + 1
    @cars = []
  end

  def save
    @@dealerships.push(self)
  end

  def self.all
    @@dealerships
  end

end
