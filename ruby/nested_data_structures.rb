# This is a real world nesting example

parking_lot = {
  :pavement => {
    :color => "black",
    :stripe_color => "yellow",
    :is_enclosed => false,
    :number_of_spots => 50
  },
  :cars => {
    :number_of_cars => 25,
    :has_trucks => true,
    :has_convertibles => false
  },
  :operations => {
    :open_weekends => false,
    :daily_special => true
  }
}

puts "What is the color of the pavement?"
puts parking_lot[:pavement][:color].capitalize
puts ""

puts "How many cars are currently on the lot?"
puts parking_lot[:cars][:number_of_cars]
puts ""

puts "Is the lot open on the weekend?"
puts parking_lot[:operations][:open_weekends].to_s.capitalize