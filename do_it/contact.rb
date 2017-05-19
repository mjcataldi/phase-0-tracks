class Contact
  attr_accessor :first_name, :last_name, :email
  attr_reader :id, :db, :list
  
  def initialize(first_name, last_name, email)
    @db = SQLite3::Database.new("doit.db")
    @db.results_as_hash
    
    @first_name = first_name.strip
    @last_name = last_name.strip
    @email = email.strip
    
    CreateContact()
    @list = @db.execute("select id, name, description, due_date from items where contact_id = ?", [contactId])
    
    TableCheck()
    CreateContact()
  end
  
  def TableCheck
    create_table_cmd = <<-SQL
      create table if not exists contacts (
        id integer primary key,
        first_name varchar(75) not null,
        last_name varchar(75) not null,
        email varchar(75) not null unique
      );
    SQL
    @db.execute(create_table_cmd)
  end
  
  def CreateContact
    results = @db.execute("select id from contacts where email = ?", @email)
    
    if results.empty?
      @db.execute("insert into contacts (first_name, last_name, email) values (?, ?, ?)", [@first_name, @last_name, @email])
    end
    new_results = @db.execute("select id from contacts where email = ?", @email).flatten!
    @id = new_results[0].to_i
  end
  
  def ListItems
    myString = ""
    @list.each do |item|
      myString += "#{item[0]}\t#{item[1]}\t#{item[2]}\t#{item[3]}"
    end
    myString
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
  
  def self.ContactInfo(email)
    db = SQLite3::Database.new("doit.db")
    db.results_as_hash
    
    return db.execute("select id, first_name, last_name from contacts where email = ?", [email])
  end
  
  def self.ContactExists(email)
    db = SQLite3::Database.new("doit.db")
    
    create_table_cmd = <<-SQL
      create table if not exists contacts (
        id integer primary key,
        first_name varchar(75) not null,
        last_name varchar(75) not null,
        email varchar(75) not null unique
      );
    SQL
    db.execute(create_table_cmd)
    
    results = db.execute("select id from contacts where email = ?", [email])
    if results.empty?
      false
    else
      true
    end
  end
  
  def self.CreateContact(first_name, last_name, email)
    db = SQLite3::Database.new("doit.db")
    db.results_as_hash
    results = db.execute("select id from contacts where email = ?", email)
    
    if results.empty?
      db.execute("insert into contacts (first_name, last_name, email) values (?, ?, ?)", [first_name, last_name, email])
    end
    new_results = db.execute("select id from contacts where email = ?", email).flatten!
    return new_results[0]
  end
  
end