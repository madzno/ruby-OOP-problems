class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

=begin
On line 11 when we re assign `quantity` we are
effectively assigning a local variable and not the
instance variable `@quantity`. Since quantity
is an isntance variable, it must be accessed with `@quantity`
notation when setting it.

Additionally, there is no setter method available to
us in the `InvoiceEntry` class.

First, we need to add a setter method to the `InvoiceEntry`
class so that we can re-assign the value of the `@quanitty`
instance variable, we can do this by changing `attr_reader`
to `attr_accessor`

Then, on line 11 we need to call the `quantity` setter
method on `self` which will represent the calling obejct
that `update_quanity` is called on; we will then be able to
re-assign the instance variable `@quanitty`.
=end
