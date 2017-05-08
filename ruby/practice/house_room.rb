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
      total += item.price
      puts "This #{item.name} is worth #{item.price}."
    end
    puts "The total dollar amount for all items in this room is #{total}."
  end

  def to_s
    "This is the #{@name} room with dimensions (#{@width} X #{@depth}."
  end

end

living_room = Room.new("Living Room", 25, 25)
puts "#{living_room.total_value}"

cardboard_box = Item.new("Cardboard Box", "Brown", 5)
piano = Item.new("Piano", "Black", 10000)

living_room.total_value