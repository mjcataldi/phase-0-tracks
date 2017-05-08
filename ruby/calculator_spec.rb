require_relative 'calculator'
require 'rspec'
# require 'debugger'

describe GuessWord do
  let(:game){ GuessWord.new }
  
  it "test user interface of guessing game" do
    expect(calculator.add(1,2)).to eq 3
  end
  
  it "subtracts two integers" do
    expect(calculator.subtract(1,1)).to eq 0
  end
end