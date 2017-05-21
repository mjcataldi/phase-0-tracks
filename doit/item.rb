require 'date'
require_relative 'contact'

class DoItItem
  attr_accessor :name, :description, :complete_date, :contact_id
  attr_reader :due_date, :id, :db

  def initialize(name, description, due, contact_id)
    @name = name.strip
    @description = description.strip
    @due_date = due
    @contact_id = contact_id
    
    @db = SQLite3::Database.new("doit.db")
    InsertItem(@db, @name, @description, @due_date, @contact_id)
  end
  
  def MarkComplete()
    due_date = @db.execute("select due_date from items where id = ?", [@id]).flatten!
    score = (Date.Today - due_date[0]).to_i
    @db.execute("update items set complete_date = ?, score = ? where id = ?", [Date.Now, score, @id])
  end
    
  def self.MarkComplete(contact_id)
    db = SQLite3::Database.new("doit.db")
    
    Contact.ListItems(contact_id)
    
    puts "What item do you want to mark complete (enter the ID#):"
    item_id = gets.strip.to_i
    
    due_date = Date.parse(db.execute("select due_date from items where id = ?", [item_id])[0][0])
    score = due_date - Date.today 
    
    due_date = due_date.to_s
    score = score.to_i.to_s
    
    db.execute("update items set complete_date = ?, score = ? where id = ?", [Date.today.to_s, score, item_id])
    puts "Done!"
    puts ""
  end
  
  def self.InsertItemUser(contactId)
    puts "What is the item you'd like to add:"
    name = gets.strip
    
    puts "What is the description:"
    description = gets.strip

    DoItItem.InsertItem(name, description, contactId)
    puts "\nHere is your list of items:"
    puts Contact.ListItems(contactId)
  end
  
  def self.InsertItem(name, description, contact_id)
    db = SQLite3::Database.new("doit.db")
    ItemsTable(db)
    due_date = Date.today.next_day(7).to_s
    
    db.execute("insert into items (name, description, due_date, contact_id) values (?, ?, ?, ?);", [name, description, due_date, contact_id])
  end
  
  def self.ItemFinished(id)
    db = SQLite3::Database.new("doit.db")
    db.execute("update items set complete_date = ? where id = ?", [Date.Now, id])
  end
  
  private 
  
  def self.ItemsTable(db)
    create_table_cmd = <<-SQL
      create table if not exists items (
        id integer primary key,
        name varchar(125) not null,
        description varchar(255),
        due_date datetime not null,
        complete_date datetime,
        contact_id int not null
      );
    SQL
    db.execute(create_table_cmd)
  end
end