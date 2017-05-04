class TodoList
  attr_accessor :todo_array

  def initialize(list)
     @todo_array = list
  end
  
  def get_item(index)
    @todo_array[index]
  end
  
  def get_items
    @todo_array
  end
  
  def add_item(item_name)
    @todo_array << item_name
  end
  
  def delete_item(value)
    @todo_array.delete(value)
  end

end

list_object = TodoList.new(["Soap", "Shampoo"])
p list_object.get_items
# ["Soap", "Shampoo"]

list_object.add_item("Brush")
p list_object.get_items
# ["Soap", "Shampoo", "Brush"]

list_object.delete_item("Shampoo")
p list_object.get_items
# ["Soap", "Brush"]

p list_object.get_item(0)
# "Soap"

p list_object