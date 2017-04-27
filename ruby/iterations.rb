def myMethod
  puts "Hello World!"
  yield("here")
  puts "Goodbye World!"
end

myMethod { |x| puts "Water is #{x}!" }