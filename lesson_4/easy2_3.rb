module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

=begin
You can find a Ruby classe's lookup chain by
calling the ancestors method on the class name
which returns an array of the classe's lookup
chain.
=end

p Orange.ancestors #=> [Orange, Taste, Object, Kernal, BasicObject]
p HotSauce.ancestors #=> [HotSauce, Taste, Object, Kernal, BasicObject]
