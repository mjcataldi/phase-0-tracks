def VampireChecker()
  isYearPass = false
  garlicBreadPass = false
  healthInsurancePass = false
  
  # Age Checker
  puts "What is your name?"
  name = gets.strip.capitalize
  
  puts "How old are you?"
  age = gets.strip.to_i
  
  puts "What year were you born?"
  yearBorn = gets.strip.to_i

  # This is a loose figure that works only some of the time, not familiar with DateTime exact 
  currentYear = 2017
  if age == currentYear - yearBorn || age == currentYear - yearBorn - 1
    isYearPass = true
  else
    isYearPass = false
  end
  
  # Garlic Bread Checker
  puts "Our company cafeteria serves garlic bread.  Should we order some for you (Y/N)?"
  isGarlicBread = gets.strip.downcase
  
  if isGarlicBread == "yes" || isGarlicBread == "y"
    garlicBreadPass = true
  else
    garlicBreadPass = false
  end
  
  # Health Insurance Checker
  puts "Would you like to enroll in the company's health insurance (Y/N)?"
  isHealthInsurance = gets.strip.downcase
  
  
  if isHealthInsurance == "yes" || isHealthInsurance == "y"
    healthInsurancePass = true
  else
    healthInsurancePass = false
  end
  
  
  #Allergy Section
  puts "Do you have any allergies (Y/N)?"
  hasAllergies = gets.strip.downcase
  hasSunAllergy = false
  
  if hasAllergies == "y" || hasAllergies == "yes" || hasAllergies == "yup"
    done = false
    
    while !done
      puts "Name something you are allergic to:"
      allergen = gets.strip.downcase
      
      if allergen == "sunshine" || allergen == "sunlight" || allergen == "sun"
        hasSunAllergy = true
        done = true
      end
      
      puts "Do you have another allergy (Y/N/Done)?"
      anotherAllergy = gets.strip.downcase
      
      if anotherAllergy == "y" || anotherAllergy == "yes" || anotherAllergy == "yup"
        done = false
      else
        done = true
      end
    end
  end
  
  # puts "Is Year Pass: #{isYearPass}"
  # puts "Is Garlice Bread Pass: #{garlicBreadPass}"
  # puts "Is Health Insurance Pass: #{healthInsurancePass}"
  # puts "Has Sun Allergy: #{hasSunAllergy}"
  
  # if isYearPass 
  #   if garlicBreadPass
  #     if healthInsurancePass
  #       if !hasSunAllergy
  #         puts "#{name} is probably not a vampire"
  #       else
  #         puts "#{name} might be a vampire"
  #       end
  #     else
  #       puts "#{name} could very well be a vampire"
  #     end
  #   else
  #     puts "#{name} is most definitely a vampire"
  #   end
  # else
  #   puts "#{name} almost certainly a vampire"
  # end
  
  if isYearPass && garlicBreadPass && healthInsurancePass && !hasSunAllergy
    puts "#{name} is probably not a vampire"
  elsif (isYearPass || garlicBreadPass || healthInsurancePass || !hasSunAllergy) == false
    puts "Dude, #{name} is almost certainly a vampire.  Wear a sweater turtleneck!"
  else
    puts "Suspicious, this #{name} person might be a vampire.  Be safe and don't go out clubbing!"
  end
  
end

def AskNumberEmployees()
  puts "How many employees will we be interviewing today?"
  number_of_candidates = gets.strip.to_i
  counter = 0
  
  # while number_of_candidates != counter
  #   VampireChecker()
  #   counter += 1
  # end
  
  until number_of_candidates == counter
    VampireChecker()
    counter += 1
  end
  
  puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
end

AskNumberEmployees()