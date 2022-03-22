class MyCar
  def initialize(name)
    @name = name
  end

  def self.gas_mileage(miles, gallons)
    gas_mileage = miles/gallons
  end
end

puts MyCar.gas_mileage(100, 15)
