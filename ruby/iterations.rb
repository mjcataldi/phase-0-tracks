# def myMethod
#   puts "Hello World!"
#   yield("here")
#   puts "Goodbye World!"
# end

# myMethod { |x| puts "Water is #{x}!" }

shopping_list = ["milk", "eggs", "bread", "twinkies"]
person = {
  :name => "Joe",
  :age => 45,
  :sign => "Pisces"
}

# shopping_list.each { |item| puts item }

# shopping_list.map! { |item| 
#   puts item.capitalize
#   item.capitalize
# }
# puts shopping_list

# new_person = []
# # person.each { |quality, answer| puts "#{quality.capitalize}\t#{answer}" }
# person.map { |quality, answer| 
#   new_person << quality
#   new_person << answer
#   }
# puts new_person

# numbers_array = [*1..15]
# puts "delete_if: #{ numbers_array.delete_if { |number| number < 9 }}"
# puts "keep_if: #{ numbers_array.keep_if { |number| number > 10 }}"
# puts "select: #{ numbers_array.select! { |number| number.even? }}"
# puts "drop_while: #{ numbers_array.drop_while { |number| number < 14 }}"

paces = {
  :walking => "15.00",
  :slow => "12.00",
  :medium => "10.00",
  :fast => "8.00",
  :veryFast => "7.00",
  :wozzers => "6.00"
}

new_paces = {
  :walking => "15.00",
  :slow => "12.00",
  :medium => "10.00",
  :fast => "8.00",
  :veryFast => "7.00",
  :wozzers => "6.00"
}

puts "delete_if: #{ paces.delete_if { | key, value | value.to_f > 10 }}"
puts "keep_if: #{ paces.keep_if { | key, value | value.to_f < 10 }}"
puts "select: #{ paces.select { | key, value | value.to_f < 8 }}"
  

paces.reject { |key, value| value.to_f < 7 }
new_paces.delete_if { |key, value| value.to_f > paces[:wozzers].to_f }
puts "reject_hybrid: #{new_paces}"

# create hash
# reject method on hash to return a new hash of rejected key-value pairs
# compare new hash to original hash
# if original hash contains key-pair from new hash
# - delete key-value pair from original hash