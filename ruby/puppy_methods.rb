class Puppy

  # This is code that is run when a new instance of the Puppy class is created
  # If mispelled, ruby will think its not an initialize method, but a regular ole instance method.
  def initialize
    puts "Initializing new puppy instance. . ."
  end

  def fetch(toy)
    toy.downcase.strip!
    puts "I brought back the #{toy}!"
    toy
  end
  
  def speak(number_of_times)
    counter = 0
    woofs = []
    while counter < number_of_times
      woofs << "woof, "
      counter += 1
    end
    
    new_woof = woofs.join(' ')
    new_woof = "#{new_woof[0..(new_woof.length - 3)].capitalize}!"
    puts new_woof
  end
  
  def rollover
    puts "Roll over!"
  end
  
  def dog_years(human_years)
    human_years * 7
  end
  
  def shake_hands
    puts "I'm shaking your hand.  This is so amazing!"
  end
  
end

# fido = Puppy.new
# fido.fetch("ball")
# fido.speak(4)
# fido.rollover
# fido.dog_years(3)
# fido.shake_hands

class Person
  attr_accessor :name, :age, :birthdate
  
  @@count = 0
  
  def self.count
    @@count
  end
  
  def initialize
    @@count += 1
  end

  def introduction
    puts "Hello, my name is #{@name.capitalize}."
  end
  
  def sleep
    puts "Zzzz . . ."
  end
  
  def laugh
    puts "Haha!"
  end
end


def make_and_store_people
  array_of_people = []
  
  counter = 0
  while counter < 50
    array_of_people << Person.new
  counter += 1
  end
  
  array_of_people
end

make_and_store_people.each do |person|
  person.laugh
end
