class Cat

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def great
    puts "Hello! My name is #{name}"
  end
end

kitty = Cat.new('Sophie')
kitty.class.generic_greeting

#Further exploration - works because you are chaining the generic_greeting
# method on to the return value of Kitty.class which is 'Cat'
