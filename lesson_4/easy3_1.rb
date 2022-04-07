class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new # instansiate a new Hello Object
hello.hi  # Hello is outputted to the screen

hello = Hello.new
hello.bye # error message because there is no method avaiable to the "hello class"

hello = Hello.new
hello.greet # argument error because greet requires an argument

hello = Hello.new
hello.greet("Goodbye") #outputs Goodbye to the screen

Hello.hi #error message because there is no defined class method 'hi' in the Hello class
