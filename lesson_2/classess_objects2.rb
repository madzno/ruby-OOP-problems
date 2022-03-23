class Person
  attr_accessor :last_name, :first_name

  def initialize(first_name = '', last_name = '')
    @first_name = first_name
    @last_name = last_name
  end

  def name
    if last_name.length > 1
      self.first_name + ' ' + self.last_name
    else
      self.first_name
    end
  end

end


bob = Person.new('Robert')
p bob.name
p bob.first_name
p bob.last_name
p bob.last_name = 'Smith'
p bob.name
