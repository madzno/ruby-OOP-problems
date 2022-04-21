class Mammal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def walk
    "#{self} #{gait} forward"
  end

  def to_s
    name
  end
end

class Person < Mammal
  private

  def gait
    "strolls"
  end
end

class Cat < Mammal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat

  private

  def gait
    "runs"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  private

  def gait
    "struts"
  end

  def to_s
    title + ' ' + super()
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"

mike = Person.new("Mike")
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk
# => "Flash runs forward"
