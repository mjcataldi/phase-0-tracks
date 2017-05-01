puts "Tell me your name, agent:"
full_name = gets.strip.downcase

name_split = full_name.split(' ')
name_split[0], name_split[1] = name_split[1], name_split[0]
name_split = name_split.join(' ')
name_split = full_name.split('')

new_name = []

  counter = 0
  while counter < name_split.length
    current_letter = name_split[counter]
    alphabet = "bcdfghjklmnpqrstvwxyz"
    vowels = "aeiou"
    new_letter = ""

    case current_letter 
      when " "
        new_letter = " "
        new_name << new_letter
        counter += 1
        next
      when "z"
        new_letter = "b"
        new_name << new_letter
        counter += 1
        next
      when "u"
        new_letter = "a"
        new_name.push(new_letter)
        counter += 1
        next
    end

    # See if vowel
    if vowels.include? current_letter
      index_of_vowel = vowels.index(current_letter)
      new_letter = vowels[index_of_vowel + 1]
    else
      index_of_letter = alphabet.index(current_letter)
      new_letter = alphabet[index_of_letter + 1]
    end
    new_name << new_letter
  counter += 1
  end
  
new_name = new_name.join('').split(' ')
first_name = new_name[0].capitalize
last_name = new_name[1].capitalize

puts "Your new name is #{first_name} #{last_name}.  Good luck out there agent!"