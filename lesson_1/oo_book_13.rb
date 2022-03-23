class Vehicle
  attr_accessor :speed, :color, :name
  attr_reader :model, :year

  @@number_of_vehicles = 0

  def initialize(y, c, m, n, s = 0)
    @@number_of_vehicles += 1
    @year = y
    @color = c
    @model = m
    @name = n
    @speed = s
  end

  def self.total_number_of_vehciles
    @@number_of_vehicles
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

module Convertable

  def top_down?(weather)
    weather == 'sunny' ? true : false
  end

end

class MyCar < Vehicle
  include Convertable

  PARKING_SPOT = '1A'

   def to_s
    "This car's name is #{name}, its color is #{color}, year is #{year}. "\
    "and model is #{model}"
  end
end

class MyTruck < Vehicle
  PARKING_SPOT = '2A'

  def to_s
    "This truck's name is #{name}, its color is #{color}, year is #{year}. "\
    "and model is #{model}"
  end
end

tesla = MyCar.new(2022, 'Red', 'Tesla2022', 'Nancy')
puts tesla

chevy = MyTruck.new(2020, 'Blue', 'Chevy2020', 'Clifford')
puts chevy
