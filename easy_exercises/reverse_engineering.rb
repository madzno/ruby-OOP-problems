class Transform

  def initialize(letters)
    @letters = letters
  end

  def uppercase
    @letters.upcase
  end

  def self.lowercase(other_letters)
    other_letters.downcase
  end
end


my_data = Transform.new('abc')
puts my_data.uppercase #ABC
puts Transform.lowercase('XYZ') #xyz
