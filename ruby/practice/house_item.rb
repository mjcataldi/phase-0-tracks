class Item
  attr_reader :name, :color, :cost
  
  def initialize(name, color, cost)
    @name = name
    @color = color
    @cost = cost
  end
  
  
  def to_s
    "#{@name} item is #{color} and costs #{cost}."
  end
end