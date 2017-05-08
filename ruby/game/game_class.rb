# Create a class that can handle properties and methods for a word guessing game. 
# Pre-populate the game with an array of words
class GuessWord
  attr_accessor :word_array
  
  def initialize(word_array)
    @word_array = word_array
  end
  
  # @name
  # def name= name
  #   @name = name
  # end
  
  # def name
  #   @name
  # end


  def guess_word_user()
    number_of_tries_attempted = 0
    number_of_tries = 8
    separator = "----------------------"
    
    word_to_guess = @word_array[rand(@word_array.length) + 1].downcase
    
    word_attempts_array = []
    letter_attempts_array = []
    
    puts "Hello, let's play a game!  I'm thinking of a word."
    puts "You can either guess a word or a letter at a time.  You have #{number_of_tries} tries.  Good luck!"
    puts separator
  
    while number_of_tries_attempted < number_of_tries
      # To see if the person can attempt to guess again.
      tries_remaining = number_of_tries - word_attempts_array.length - letter_attempts_array.length
      
      if tries_remaining == 0
        puts "Nuts, you ran out of guesses!  The word we were looking for was '#{word_to_guess.capitalize}.'"
        return false
        break
      end
    
      puts "Your word has #{word_to_guess.length} letters in it and you have #{tries_remaining} tries remaining.  Guess the word or a letter:"
      puts ""
      user_guess = gets.strip.downcase
      
      # Gives user feedback if already tried a letter or word
      if word_attempts_array.include?(user_guess) == true || letter_attempts_array.include?(user_guess) == true
        puts "Hmm, you've already tried guessing '#{user_guess}.'  Try again, you still have #{tries_remaining} tries left!"
        next
      end

      # First finds if it's a letter/word, then checks to see if is in or is word
      if user_guess.length != 1 
        if user_guess == word_to_guess
          puts "Awesome, you got it!  The word was '#{word_to_guess}.'  Good job!"
          return true
        else
          word_attempts_array << user_guess
          puts "Nuts, we'll have to try that again. You have #{tries_remaining} tries remaining."
        end
      else
        if word_to_guess.include?(user_guess) == true
          letter_attempts_array << user_guess
          puts "You got one letter correct. You have #{tries_remaining} tries remaining."
        else
          letter_attempts_array << user_guess
          puts "Shoot!  Try again, you have #{tries_remaining} tries remaining."
        end
      end
      
      puts ""
      puts "Here is what you have so far: "
      clue_word = ""
      word_to_guess.split('').each { |letter| 

        if letter_attempts_array.include?(letter)
          clue_word += "#{letter} "
        else
          clue_word += "_ "
        end
      }
      puts clue_word
      puts ""
      
      guessed_letters = ""
      letter_attempts_array.each { |letter| guessed_letters += "#{letter} " }
      guessed_words = word_attempts_array.each { |word| p "#{word} " }
      puts "Guessed letters: #{guessed_letters}"
      puts "Guessed words: #{guessed_words}"
    end
    
  end
end

new_game = GuessWord.new(["paper", "clipboard", "coaster", "mouse", "keyboard", "lamp", "computer", "browser"])
new_game.guess_word_user()