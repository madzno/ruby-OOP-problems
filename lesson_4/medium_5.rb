=begin
Problem : custom to_s method
Input: object with filling type and glazing
Output : string that matches the ones below

donut 1
filling_type = nil
glazing = nil
Output: "Plain"

donut 2
filling_type = "Vanilla"
glazing = 'nil'
Output "Vanilla"

donut 3
filling_type = nil
glazing = 'sugar'
Output "Plain with sugar"

- when filling_type is nil (nil?) AND glazing type is nill
outpt 'plain'

- when filling_type is nil assign local variable filling type
to plain and output filing type with glazing type (instance variable)

- when glazing is nil (nil?) then only output filling type instance
variable

=end

class KrispyKreme
  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    if filling_type == nil && glazing == nil
      "Plain"
    elsif filling_type == nil
      "Plain with #{glazing}"
    elsif glazing == nil
      "#{filling_type}"
    else
      "#{filling_type} with #{glazing}"
    end
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
# => "Plain"

puts donut2
# => "Vanilla"

puts donut3
  # => "Plain with sugar"

puts donut4
  # => "Plain with chocolate sprinkles"

puts donut5
  # => "Custard with icing"
