require_relative 'game_class.rb'
require 'rspec'
# require 'debugger'

describe GuessWord do
  let(:game){ GuessWord.new }
  
  it "test user interface of guessing game" do
    expect(game_word_user(["tool", "cup"]).to eq true) || expect(game_word_user(["tool", "cup"]).to eq false)
  end
  
end