=begin
We get this error because we only have an
attr_reader method in our Person class and not
an attr_accessor. Therefore there is no defined
setter method when we try and call name= on line
9. We can fix this by changing the attr_reader on
line 2 to attr_accessor.
=end
