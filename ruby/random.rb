# Decrypts and Encrypt Methods

# Encrypts by displacing value by 1
def encrypt(message)
  new_message = ""
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  
  counter = 0
  while counter < message.length
  
    if alphabet.index(message[counter]) == 25
      new_message += alphabet[0]
    else
      new_message += message[counter].next
    end
    
  counter += 1
  end
  new_message
end

# Decrypts by replacing value by 1
def decrypt(message)
  new_message = ""
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  
  counter = 0
  while counter < message.length
    if alphabet.index(message[counter]) == 0
      new_message += alphabet[25]
    else
      new_message += alphabet[alphabet.index(message[counter]) - 1]
    end
  counter += 1
  end
  new_message
end

# puts "What is your message?"
# my_message = gets.strip

# puts "Your encrypted message is #{encrypt(my_message)}."
# puts "Your decrypted message is #{decrypt(encrypt(my_message))}"

def userCheck()
  # Ask for name
  # Ask for password and verify (loop if don't have it correct)
  # Ask whether decrypt or encyrpt
  
  password = "HankyBaby*9878"
  
  puts "Hello, what is your name?"
  user_name = gets.strip
  
  input_password = ""
  
  while input_password != password
    puts "What is the password?"
    input_password = gets.strip
  end
  
  puts "Cool, you're in!"
  
  try_again = true
  while try_again
    try_again = false
    puts "Would you like to encrypt ('E') or decrypt ('D') a message?"
    input_crypt = gets.strip.downcase
    
    if input_crypt == "e" || input_crypt == "encrypt"
      # code for encrypt
      puts "Enter your encrypted code here (no punctuation please!):"
      encrypt_message = gets.strip.downcase
      
      puts "Your encrypted message is #{encrypt(encrypt_message)}."
    elsif input_crypt == "d" || input_crypt == "decrypt"
      # code for decrypt
      puts "Enter your decrypted code here (no punctuation please!):"
      encrypt_message = gets.strip.downcase
      
      puts "Your decrypted message is #{decrypt(encrypt_message)}."
    else
      puts "Hmm, I didn't understand that, let's try that again."
      try_again = true
    end
  end
  
end

userCheck()
