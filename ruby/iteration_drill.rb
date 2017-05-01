# # Array Drills

zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]

# # 1. Iterate through the zombie_apocalypse_supplies array,
# # printing each item in the array separated by an asterisk
# # ----

def asterisk_supplies(supplies)
  supplies.each { |value| puts "#{value}*" }
end
# asterisk_supplies(zombie_apocalypse_supplies)


# # 2. In order to keep yourself organized, sort your zombie_apocalypse_supplies
# # in alphabetical order. Do not use any special built-in methods.
# # ----

def sort_supplies(supplies)
  moved = true
  while moved == true
  moved = false
  
    counter = 0
    while counter < supplies.length
      if counter == 0
        counter += 1
        next
      elsif supplies[counter].downcase < supplies[counter - 1].downcase
        supplies[counter], supplies[counter - 1] = supplies[counter - 1], supplies[counter]
        moved = true
      end
      counter += 1
    end
  end
  supplies
end
# sort_supplies(zombie_apocalypse_supplies).each { |value| puts "#{value}." }

# # 3. Create a method to see if a particular item (string) is in the
# # zombie_apocalypse_supplies. Do not use any special built-in methods.
# # For instance: are boots in your list of supplies?
# # ----

def supply_in_list(item, supplies)
  item.strip.downcase!
  counter = 0
  reply = ""
  
  while counter < supplies.length
    if supplies[counter].downcase.strip == item
      reply = "Yes, the supply #{item} is in the list."    
      break
    else
      reply = "No, the supply #{item} is not in the list."    
    end
  counter += 1
  end
  reply
end
# puts supply_in_list("hatchet", zombie_apocalypse_supplies)


# # 4. You can't carry too many things, you've only got room in your pack for 5.
# # Remove items in your zombie_apocalypse_supplies in any way you'd like,
# # leaving only 5. Do not use any special built-in methods.
# # ----

def remove_items(supplies)
  counter = 0
  
  while counter < supplies.length
    if supplies.length > 5
      supplies.delete_at(counter)
    end
  counter += 1
  end
  supplies
end
# remove_items(zombie_apocalypse_supplies).each { |value| puts "#{value}." }

# # 5. You found another survivor! This means you can combine your supplies.
# # Create a new combined supplies list out of your zombie_apocalypse_supplies
# # and their supplies below. You should get rid of any duplicate items.
# # Find the built-in method that helps you accomplish this in the Ruby
# # documentation for Arrays.
# other_survivor_supplies = [ "warm clothes", "rations", "compass", "camp stove",
#                             "solar battery", "flashlight"]
# # ----

def combine_supplies(supplies1, supplies2)
  new_supplies = supplies1 << supplies2
  new_supplies.flatten!
  new_supplies.uniq!
end
# combine_supplies(zombie_apocalypse_supplies, other_survivor_supplies)

# Hash Drills

extinct_animals = {
  "Tasmanian Tiger" => 1936,
  "Eastern Hare Wallaby" => 1890,
  "Dodo" => 1662,
  "Pyrenean Ibex" => 2000,
  "Passenger Pigeon" => 1914,
  "West African Black Rhinoceros" => 2011,
  "Laysan Crake" => 1923
}

# 1. Iterate through extinct_animals hash, printing each key/value pair
# with a dash in between the key and value, and an asterisk between each pair.
# ----

def list_endangered_animals(hashed_list)
  hashed_list.each { |key, value| puts "#{key} - #{value}.*" }
end
# list_endangered_animals(extinct_animals)

# 2. Keep only animals in extinct_animals if they were extinct before
# the year 2000. Do not use any special built-in methods.
# ----

def before_2000(hashed_list)
  new_hashed_list = {}
  
  hashed_list.each { |key, value|
    if value.to_i < 2000
      new_hashed_list[key] = value.to_i
    end
  }
  new_hashed_list
end
# before_2000(extinct_animals).each { |key, value| puts "#{key} - #{value}" }


# 3. Our calculations were completely off, turns out all of those animals went
# extinct 3 years before the date provided. Update the values in extinct_animals
# so they accurately reflect what year the animal went extinct.
# Do not use any special built-in methods.
# ----

def update_list(hashed_list)
  new_hashed_list = {}
  
  hashed_list.each { |key, value|
    new_hashed_list[key] = (value.to_i - 3)
  }
  
  new_hashed_list
end
# update_list(extinct_animals).each { |key, value| puts "#{key} - #{value}." }


# 4. You've heard that the following animals might be extinct, but you're not sure.
# Check if they're included in extinct_animals, one by one:
# "Andean Cat"
# "Dodo"
# "Saiga Antelope"
# Do not use any special built-in methods.
# ----

def check_if_endangered(check_animal, hashed_list)
  isIncluded = false
  
  hashed_list.each { |key, value| 
    check_animal = check_animal.strip.downcase
    
    if key.strip.downcase == check_animal
      isIncluded = true
      break
    end
  }
  
  if isIncluded 
    puts "The #{check_animal.strip.capitalize} is on the list of extinct animals."
  else
    puts "The #{check_animal.strip.capitalize} is not on the list of extinct animals."
  end
  
end
# check_if_endangered("Andean Cat", extinct_animals)
# check_if_endangered("Dodo", extinct_animals)
# check_if_endangered("Saiga Antelope", extinct_animals)

# 5. We just found out that the Passenger Pigeon is actually not extinct!
# Remove them from extinct_animals and return the key value pair as a two item array.
# Find the built-in method that helps you accomplish this in the Ruby documentation
# for Hashes.

def remove_animal(animal, hashed_list)
  
  
  
end