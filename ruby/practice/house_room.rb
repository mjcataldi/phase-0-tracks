require_relative 'house_item.rb'

class Room
  attr_reader :length, :width
  attr_accessor :items, :name

  def initialize(name, width, length)
    @name = name
    @width = width.to_f
    @length = length.to_f
    @items = []
  end
  
  def total_value
    total = 0
    @items.each do |item| 
      total += item.cost
      puts "This #{item.name} is worth #{item.cost}."
    end
    puts "The total dollar amount for all items in this room is #{total}."
  end

  def to_s
    "This is the #{@name} room with dimensions (#{@width} X #{@length})."
  end

end

# living_room = Room.new("Living Room", 25, 25)
# cardboard_box = Item.new("Cardboard Box", "Brown", 5)
# piano = Item.new("Piano", "Black", 10000)
# living_room.items << cardboard_box
# living_room.items << piano
# living_room.total_value
# puts living_room.to_s
