require_relative 'house_room.rb'

class House
  attr_reader :rooms
  
  def initialize()
    
  end
  
  def add_room(room)
    if @rooms.length < 11
      @rooms << room
      true
    else
      false
    end
  end
  
  def to_s
    house_str = ""
    house_str = @rooms.each do |room| 
      house_str << room.to_s.upcase
      house_str << "\n"
      
      room_str = ""
      room_str = room.items.each do |item|
        room_str << item.to_s.downcase
        room_str << "\n"
      end
    end
    house_str
  end
end

myHouse = House.new()
  living_room = Room.new("Living Room", 35, 35)
    living_room.items << Item.new("Couch", "Red", 900)
    # living_room.items << Item.new("Sofa", "Red", 1900)
    # living_room.items << Item.new("Lamp 1", "Black", 25)
    # living_room.items << Item.new("Lamp 2", "Black", 35)
    # living_room.items << Item.new("Rug", "Blue", 200)
myHouse.add_room(living_room)

  bedroom1 = Room.new("Bedroom 1", 15, 15)
    bedroom1.items << Item.new("Bed", "Blue", 1000)
    # bedroom1.items << Item.new("Side Table 1", "Brown", 1000)
    # bedroom1.items << Item.new("Side Table 2", "Brown", 1000)
    # bedroom1.items << Item.new("Rug", "Black", 200)
    # bedroom1.items << Item.new("Lamp 1", "White", 25)
    # bedroom1.items << Item.new("Lamp 2", "White", 35)
myHouse.add_room(bedroom1)

  # bedroom2 = Room.new("Bedroom 1", 15, 15)
  #   bed = Item.new("Bed", "Blue", 1000)
  #   side_table_1 = Item.new("Side Table 1", "Brown", 1000)
  #   side_table_2 = Item.new("Side Table 2", "Brown", 1000)
  #   rug = Item.new("Rug", "Black", 200)
  #   lamp1 = Item.new("Lamp 1", "White", 25)
  #   lamp2 = Item.new("Lamp 2", "White", 35)
    
  # kitchen = Room.new("Kitchen", 25, 10)
  #   stove = Item.new("Stove", "White", 589)
  #   microwave = Item.new("Microwave", "Black", 500)
  #   sink = Item.new("Sink", "Silver", 1000)
  #   counter = Item.new("Counter", "White", 1599)

  myHouse.to_s