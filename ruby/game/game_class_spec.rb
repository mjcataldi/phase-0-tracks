require_relative 'game_class.rb'
require 'rspec'
# require 'debugger'

describe GuessWord do
  let(:game){ GuessWord.new(["paper", "clipboard", "coaster", "mouse", "keyboard", "lamp", "computer", "browser"]) }
  
  it "test user interface of guessing game" do
    expect(game.guess_word_user().to eq true) || expect(game.guess_word_user().to eq false)
  end
  
end