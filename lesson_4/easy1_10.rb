class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

Bag.new('yellow', 'leather')

=begin
If no arguments passed and just
.new, it will cause an ArgumentError
=end
