class Vehicle
  attr_accessor :speed, :color

  def initialize(s, c)
    @speed = s
    @color = c
  end

  def speed_up(s)
    self.speed = s
  end

   def brake(s)
    self.speed = s
  end

  def off
    self.speed = 0
  end


  def spray_paint(c)
    self.color = c
  end

  def gas_mileage(miles, gallons)
    gas_mileage = miles/gallons
  end

end

class MyCar < Vehicle

  PARKING_SPOT = '1A'

  attr_accessor :color, :model, :speed, :name
  attr_reader :year

  def initialize(y, c, m, n, s = 0)
    super(s, c)
    @year = y
    @color = c
    @model = m
    @speed = s
    @name = n
  end

   def to_s
    "This car's name is is #{name}, its color is #{color}, year is #{year}. "\
    "and model is #{model}"
  end
end

class MyTruck < Vehicle
  PARKING_SPOT = '2A'
end
