=begin

attr_reader gives us the getter method and an instance variable

attr_writer gives us the setter method and an instance variable

attr_accessor gives us both the getter method, the instance variables and
the setter method

attr_accessor would give us the same output but would be adding an
unneccesary setter method to our code

attr_writer would give us an error message because we need the
'getter' method for our examples

If we add the following getter methods manually this would also work,
the advantage of this would be if we wanted to validate our input or
add additional functionality to the getter/setter methods
=end
