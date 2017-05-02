class Puppy
  attr_accessor :name, :type, :age, :friendly
  @@count = 0
  
  def initialize
    @@count += 1
  end
  
  def Bark
    if @name.length != 0
      puts "Ruff, ruff-ruff! My name is #{@name} and I am tough!"
    else
      puts "Ruff, ruff-ruff! I don't have a name, but I am tough!"
    end
  end
  
  def Sleep
    if @name.length != 0
      puts "#{@name} talks to themselves in the third person, man are they tired!"
    else
      puts "#This dog talks to themselves in the third person, man are they tired!"
    end
  end
  
  def self.count
    @@count
  end

end

fido = Puppy.new
fido.name = "Fido"

dodo = Puppy.new
dodo.name = "Dodo"

bojangles = Puppy.new
bojangles.name = "Mr. Bo Jangles"

fido.Sleep
fido.Bark

puts "There are currently #{Puppy.count} puppy/puppies that have been created.  Woof woof!"