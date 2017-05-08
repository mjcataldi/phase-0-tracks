# Create a class that can handle properties and methods for a word guessing game. 
# Pre-populate the game with an array of words
require_relative 'game_module.rb'

class GuessWord
  include GameModule
  attr_accessor :word_array
  
  def initialize(word_array = ["paper", "clipboard", "coaster", "mouse", "keyboard", "lamp", "computer", "browser"])
    @word_array = word_array
  end
  
  # Hey guys, having a hard time figuring out what kind of method to use here.  It seems that there's only sub portions that can be machine based.  Have tried my best!
  def total_step_through()
    puts "Player 1: Please enter a set of word(s) separated by a comma (,) that you wish your opponent to choose from:"
    words_string = gets.downcase.strip
    words_array = []
    default_tries = 8
    
    if words_string.length == 0
      words_array = @word_array
      words_array.each { |word| words_string += "#{word} "}
      words_string.strip!
    else
      words_string.split(',').each { |word| words_array << word.strip }
    end
    word_to_guess = words_array[rand(words_array.length + 1)]
    puts ""


    puts "How many tries would you like Player 2 to have (a default amount of #{default_tries} tries will be implemented if left blank)?"
    number_of_tries = gets.strip.to_i
    puts ""
    
    if number_of_tries == 0
      number_of_tries = default_tries
    end
    
    puts "Ok, Player 2 will have #{number_of_tries} to guess one of these word(s): '#{ words_string }'."
    
    number_of_seconds = 4
    puts "These results will disappear in #{number_of_seconds} seconds."
    
    sleep number_of_seconds
    system "clear" # or system "cls"
    
    guess_word_user(word_to_guess, number_of_tries)
  end
end

new_game = GuessWord.new()
new_game.total_step_through()