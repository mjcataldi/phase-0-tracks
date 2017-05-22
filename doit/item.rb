require 'date'
require 'sqlite3'
require_relative 'contact'

class Item
  attr_accessor :name, :description, :complete_date, :contact_id
  attr_reader :due_date, :id, :db, :score

  def initialize(item_id)
    @db = SQLite3::Database.new("doit.db")
    cmd = <<-SQL
      select id, name, description, due_date, complete_date, contact_id, score
      from items
      where id = ?
    SQL
    item_array = @db.execute(cmd, [item_id]).flatten
    
    if item_array.empty?
      puts "Hmm, we don't have that on file."
      exit
    else
      @id = item_array[0]
      @name = item_array[1]
      @description = item_array[2]
      @due_date = item_array[3]
      @complete_date = item_array[4]
      @contact_id = item_array[5]
      @score = item_array[6]
    end
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
    score = (due_date - Date.today).to_s[0].to_i
    due_date = due_date.to_s

    db.execute("update items set complete_date = ?, score = ? where id = ?", [Date.today.to_s, score, item_id])
    puts "Done!\n"
  end
  
  def self.InsertItemUser(contactId)
    contact = Contact.new(contactId)
    
    puts "What is the item you'd like to add:"
    name = gets.strip
    
    puts "What is the description:"
    description = gets.strip

    Item.InsertItem(name, description, contactId)
  end
  
  def self.InsertItem(name, description, contact_id)
    db = SQLite3::Database.new("doit.db")
    ItemsTable(db)
    due_date = Date.today.next_day(7).to_s
    
    db.execute("insert into items (name, description, due_date, contact_id) values (?, ?, ?, ?);", [name, description, due_date, contact_id])
  end
  
  def self.ItemFinished(id)
    db = SQLite3::Database.new("doit.db")
    cmd = <<-SQL
      select due_date from items where id = ?
    SQL
    due_date = db.execute(cmd, [id]).flatten[0]
    score = (Date.today - due_date).to_s[0]
    
    db.execute("update items set complete_date = ?, score = ? where id = ?", [Date.today, score, id])
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
        contact_id int not null,
        score int
      );
    SQL
    db.execute(create_table_cmd)
  end
  
end