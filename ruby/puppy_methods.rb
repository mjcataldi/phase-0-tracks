class Puppy

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

fido = Puppy.new
fido.fetch("ball")
fido.speak(4)
fido.rollover
fido.dog_years(3)
fido.shake_hands