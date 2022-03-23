class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
    puts "Hello! my name is #{name}"
  end
end

kitty = Cat.new('Sophie')
