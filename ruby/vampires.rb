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
  
  if isYearPass 
    if garlicBreadPass
      if healthInsurancePass
        puts "#{name} is probably not a vampire"
      elsif
        puts "#{name} could be a vampire"
      end
    elsif
      puts "#{name} could very well be a vampire"
    end
  elsif
    puts "#{name} almost certainly a vampire"
  end
end

VampireChecker()