class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year

  def initialize(y, c, m, s = 0)
    @year = y
    @color = c
    @model = m
    @speed = s
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
end

tesla = MyCar.new(2022, 'Black', 'Tesla2022')
puts tesla.color
tesla.spray_paint('Red')
puts tesla.color
