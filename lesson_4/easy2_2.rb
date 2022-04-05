class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
p trip.predict_the_future

=begin
The above will output "you will" followed by
one of the choices defined in the RoadTrip class.
Since 'predict the future' is called on an instance of the
RoadTrip class, Ruby resolves the 'choices' method called on line
3 by first searching the methods in the calling object's class (RoadTrip) before
its superclass (Oracle).
=end
