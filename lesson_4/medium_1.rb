class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

=begin
Ben is right because he added an attr_reader to
the BankAccount class which provides a getter method
called `balance` that returns the value of the
@balance instance variable.

On line 9, the reference to the `balance` method will
return the value of the `@balance` instance variable

If `attr_reader` was absent, Alyssa would be right. We
would require `@` or `self` to proceed balance to be
sure we are referring to the instance variable `@balance`
and not a local variable `balance`
=end
