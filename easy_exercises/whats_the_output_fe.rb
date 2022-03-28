class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# produces these results because on line 15 we are adding 1 to the local variable
# name while on line 14 we are passing the local variable as an argument to the
# initialize method and in turn assigning it to the instance variable @name
# @name points at the string '42' while local variable name outside of the class
# pet points to the integer 42. Thus the addition on line 15 has no effect on the
# string object '42' that is assigned to @name and this is why 42 outputs everytime
# puts is called and passed fluffy.name  as an argument while 43 is outputted when puts is called and passed
# name as an argument
