class Puppy
  attr_accessor :name, :type, :age, :friendly
  
  # def initialize(name, type, age, friendly)
  #   @name = name
  #   @type = type
  #   @age = age
  #   @friendly = friendly
  # end
  
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
  
  def self.Count
    @@count += 1
  end

end

fido = Puppy.new
fido.name = "Fido"
fido.Sleep
fido.Bark