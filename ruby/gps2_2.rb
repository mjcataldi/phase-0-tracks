# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # [fill in any steps here]
  # set default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]

grocery_list = {}

def intialize_list(initial_list, default_quantity = 1)
  grocery_list = {}
  intial_list_array = initial_list.split(' ')
  
  counter = 0
  while counter < intial_list_array.length
    grocery_list.store(intial_list_array[counter], default_quantity)
  counter += 1
  end
  
  return grocery_list
end

grocery_list = intialize_list("")
puts grocery_list

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: summon list in signature, define method to add item to list
# output:

def add_item(item, list, default_quantity = 1)
  list.store(item, default_quantity)
end

add_item("lemonade", grocery_list, 2)
add_item("tomatoes", grocery_list, 3)
add_item("onion", grocery_list, 1)
add_item("ice cream", grocery_list, 4)
puts grocery_list

# Method to remove an item from the list
# input:
# steps:
# output:

def remove_item(item, list)
  list.delete(item)
end

remove_item("lemonade", grocery_list)
puts grocery_list

# Method to update the quantity of an item
# input:
# steps:
# output:

def update_item(item, list, default_quantity)
  list[item] = default_quantity
end

update_item("ice cream", grocery_list, 1)
puts grocery_list


# Method to print a list and make it look pretty
# input:
# steps:
# output:

puts "Here are a list of your items:"
grocery_list.each { |item, number| puts "#{item.capitalize}(#{number})" }