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

=begin
This is done by using `#{self.class}`

In this piece of code `self` represents the calling object which in
this case is the Car object referenced by 'small_car'.

The `class` method is then called on the `small_car` object which
returns the class of the object referenced by `small_car`, class `Car`.`

String interpolation represented by the `#{}` symbol then automatically
calls the to_s method and `'Car'` is returned.

=end
