class MyCar
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.gas_mileage(miles, gallons)
    gas_mileage = miles/gallons
  end

  def to_s
    "This car's name is is #{name}"
  end
end

tesla = MyCar.new('Ruby')
puts tesla
