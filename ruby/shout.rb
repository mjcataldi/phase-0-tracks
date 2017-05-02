module Shout
  
  def yell_angrily(words)
    puts words + "!!!" + " :("
  end
  
  def yelling_happily(words)
    puts words + "!!!" + " :-)"
  end
  
  # def another_method(words)
  #   puts words + "! :-P"
  # end
  
end

class Person
  include Shout
  attr_accessor :first_name, :last_name, :email
  
  @@count = 0
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@count += 1
  end
  
  def self.count
    @@count
  end
  
  def say_hello
    puts "Hello, my name is #{first_name} #{last_name}!"
  end

end

# Shout.yelling_happily("Hurray")
# Shout.yell_angrily("Nuts")
# Shout.another_method("Pops")

matt = Person.new("Matthew", "Cataldi")
matt.yell_angrily("Narph")
matt.say_hello