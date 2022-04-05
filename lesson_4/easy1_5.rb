class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

=begin
Class pizza has an instance variable and we know because of the
@ symbol in front of it

Can also call the method .instance_variables to and an array
of the instance variables for that object will be returned
=end
