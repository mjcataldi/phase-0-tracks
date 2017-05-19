class DoItItem
  attr_accessor :name, :description, :complete, :contact_id
  attr_reader :due, :id 

  def initialize(name, description, due, contact_id)
    @name = name.strip
    @description = description.strip
    @due = due
    @contact_id = contact_id
    
    @db = SQLite3::Database.new("doit.db")
    InsertItem(db, @name, @description, @due, @contact_id)
  end
  
  def InsertItem(db, name, description, due_date, contact_id)
    ItemsTable(db)
    db.execute("insert into items (name, description, due_date, contact_id) values (?, ?, ?, ?);", [name, description, due_date, contact_id])
  end
  
  def self.ListItems(contactId)
    db = SQLite3::Database.new("doit.db")
    db.results_as_hash()
    myString = ""
    
    results = db.execute("select id, name, description, due_date from items where contact_id = ?", [contactId])
    if !results.empty?
      counter = 1
      results.each do |result|
        myString += "#{counter}. #{result[0]}\t#{result[1]}\t#{result[2]}\n"
        counter += 1
      end
    else
      myString += "Oh no, we need some things to do!"
    end
    
    return myString
  end
  
  private 
  
  def self.ItemsTable(db)
    create_table_cmd = <<-SQL
      create table if not exists items (
        id integer primary key,
        name varchar(125) not null,
        description varchar(255),
        due_date datetime not null,
        complete bit default false,
        contact_id int not null
      );
    SQL
    db.execute(create_table_cmd)
  end
end