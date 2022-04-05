=begin
We can add the ability for them to go_fast by including the Speed
module in both of the glasses

We can check if the car and truck can now go fast by instantiating
a new truck and car object and calling the go_fast method
on that object
=end


module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Car.new.go_fast
Truck.new.go_fast
