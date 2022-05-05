class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

=begin
This codes raises an argument error. This is due to the call to super in the
Songbird initialize method.

On line 50, a new SongBird object is instatiated by calling the `::new` method on
the SongBird class name. `::new` automatically invokes the initialize method
in the Songbird class on line 36.

When `::new` is invoked on line 50 it is passed three arguments :omnivore, 'sing', and 'chrp chirr chirp chirp chirrr' respectively,
which are in turn passed to the Songbird initialize method on line 36 and referenced by diet, superpower, and song.

On line 37 the keyword `super` is invoked which searches the SongBird's class method look up chain for a method
of the same name which it finds in the superclass Animal on line 2. However, since super is called without any
specified arguments, all three arguments referenced by diet, superpower, and song are passed to the Animal initialize method.

Since the Animal initialize method only takes two arguments; diet and superpower; passing three arguments to the Animal
initialize method raises an Arugment error.

We can fix this code to not raise an error by calling super with the arguments we specifically want passed to the
Animal initialize method; `diet` and `superpower` respectively.
=end



