class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

=begin

The @@cats_count variable is a class variable and
records a state of the class at the class level.

All instances and sub classes of Cat will share one
copy of the class variable

IN this example, `@@cats_count` is initialized
on line 2 to the integer 0

Each time a new Cats object is instantiated
the `@@cats_count` variable is re-assigned to the
return value of incrementing its current value by
1. Thus the `@@cats_count` variable keeps
track of how many cat instances have been created.
=end

kitty = Cat.new('black')
scooter = Cat.new('orange')
p Cat.cats_count
