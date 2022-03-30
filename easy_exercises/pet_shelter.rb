=begin
Classes

Pet
- pet type and pet name getter methods
-initialize method input is type and name
- initialize an instance variable called pet type to type
- initialize an instance variable called pet name to name

Owner 'owners have pets'
- name, pets, and number of pets getter methods
- number of pets setter method
- initialize method that takes name as an argument
- initialize instance variable owners name to name
- initialize an instance variable pets to an empty array
- initialie an instance variable number of pets to 0


Shelter
- need access to owners getter method for pets
- need access to owners number of pets variable (setter)

adoptions getter and setter methods
initialize method with no arguments
-initialize instance variable adoptions to an empty hash


Adopt method (under shelter)
- input is owner object and pet object
- call the pets getter method (from Owners class) on the owner object
- destructively append the pet object to the pets array
- add 1 to the number of pets variable (from owners class)

Print adoptions method
- for each key value pair
- print out key owner's name - need access to owner's object name getter method
- print out each pet in the value - need access to pet object's type of pet and name getter methods


=end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
