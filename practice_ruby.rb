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


class Room
  attr_reader :length, :width
  attr_accessor :items, :name

  # def name=name
  #   @name = name.capitalize
  # end


  def initialize(name, width, length)
    @name = name
    @width = width
    @length = length
    @items = []
  end
  
  def total_value
    total = 0
    @items.each do |item| 
      total += item.price
    end
    return total
  end

  def to_s
    "This is the #{@name} room"
  end

end