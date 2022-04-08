=begin

Both of these pieces of code will produce the same result but
they differ in the way they accomplish the task.

The first difference is in the first `create_template``
method we are refeferencing the instance variable `@template``
directly and assigning it to the string object "template 14231" while
in the second we are calling the setter `template=` method on the calling
object represented by `self`.

The second difference is that in the first `show_template`` method wea
are invoking the getter method `template` which returns the current
object `@template` is assigned to when `show_template` is called on
an instance of the `Computer` class. While in the second `show_template``
method we are calling the `template` getter method on `self` which
represents the current calling object. The getter method doesn't require
self so the first example is preferred.

=end
