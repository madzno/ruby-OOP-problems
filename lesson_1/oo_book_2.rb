=begin
What is a module? What is its purpose?
How do we use them with our classes?
Create a module for the class you created
in exercise 1 and include it properly.
=end

=begin
A module is a collection of behaviors
that is usuable in other classes via a mixin

Its a way we achieve polymorphism in Ruby and how
we can use a certain behavior by objects of differnt
classess

We use them in our classes by "mixing them in" using
`include` method invocation
=end

module Music
  def music(instrument)
    puts instrument
  end
end

class StPatricks
  include Music
end

lucky = StPatricks.new
lucky.music('Bag Pipes')
