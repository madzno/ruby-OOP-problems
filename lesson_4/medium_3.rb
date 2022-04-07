=begin
Altering the public interface of the
class.

In other words, you are now allowing
clients of the class to change the quantity directly
through an accessor method

Means that protections built into
update qualintity method can be circumvented.

If you want update quanitty to be completely
private can't use self and a setter method -
would need to put update_quantity private
and refer to @quantity directly on line 10.

=end
