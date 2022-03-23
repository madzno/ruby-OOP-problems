class Person
  attr_accessor :last_name, :first_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    if last_name.length > 1
      self.first_name + ' ' + self.last_name
    else
      self.first_name
    end
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(name)
    first, last = name.split
    self.first_name = first
    self.last_name = name.split.length > 1 ? last : ''
  end

end


bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
