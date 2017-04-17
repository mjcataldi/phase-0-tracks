def MyMethod(myVariable)
  puts "This is my new variable: #{myVariable}."
end

puts "Enter something here:"
newStuff = gets.chomp

MyMethod(newStuff)