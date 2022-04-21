class Shelter
  attr_accessor :adoptions, :available

  def initialize
    @adoptions = {}
    @available = []
  end

  def adopt(owner, pet)
    owner.add_pet
    available.delete(pet)
    if adoptions.has_key?(owner)
      adoptions[owner] << pet
    else
      adoptions[owner] = [pet]
    end
  end

  def print_adoptions
    adoptions.each do |key, value|
      puts "#{key.name} has adopted the following pets: "
      value.each do |pet|
        puts "a #{pet.type} named #{pet.name}"
      end
      puts ""
    end
  end

  def add_pet(pet)
    available << pet
  end

  def print_unadopted
    puts "The Animal Shelter has the following unadopted pets:"
    available.each do |pet|
      puts "a #{pet.type} named #{pet.name}"
    end
    puts ''
  end

  def number_of_unadopted
    available.length
  end
end

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_accessor :name, :number_of_pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
  end

  def add_pet
    self.number_of_pets += 1
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
fluffy       = Pet.new('cat', 'Fluffy')
bluebell     = Pet.new('parakeet', 'Bluebell')


phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.add_pet(butterscotch)
shelter.add_pet(pudding)
shelter.add_pet(darwin)
shelter.add_pet(kennedy)
shelter.add_pet(sweetie)
shelter.add_pet(molly)
shelter.add_pet(chester)
shelter.add_pet(asta)
shelter.add_pet(fluffy)
shelter.add_pet(bluebell)

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_adoptions
shelter.print_unadopted

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The animal shelter has #{shelter.number_of_unadopted} unadopted pets."
