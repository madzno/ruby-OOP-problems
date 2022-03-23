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

  def to_s
    name
  end

  private

  def parse_full_name(name)
    first, last = name.split
    self.first_name = first
    self.last_name = name.split.length > 1 ? last : ''
  end

end

bob = Person.new("Robert Smith")
puts "The person's name is #{bob}"
