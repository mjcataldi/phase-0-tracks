require_relative 'calculator'
require 'rspec'
require 'debugger'

describe Calculator do
  let(:calculator){
    Calculator.new
  }
  
  it "adds two integers" do
    expects(calculator.add(1,2)).to eq 3
  end
  
  it "subtracts two integers" do
    expects(calculator.subtract(1,1)).to eq 0
  end
  
  it "multiplies two integers" do
    expects(calculator.multiply(1,2)).to eq 2
  end
end