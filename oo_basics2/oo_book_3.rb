class MyCar
  attr_accessor :year, :color, :model, :speed

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
end

tesla = MyCar.new(2022, 'black', 'tesla2022')


