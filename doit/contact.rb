require 'date'
require 'sqlite3'
require_relative 'item'

class Contact
  attr_accessor :first_name, :last_name, :email
  attr_reader :id, :db, :items, :view_active
  
  def initialize(id)
    @db = SQLite3::Database.new("doit.db")
    TableCheck()
    cmd = <<-SQL
      select id, first_name, last_name, email, view_active from contacts where id = ?
    SQL
    
    @id = id
    contact_array = @db.execute(cmd, [@id]).flatten
    
    if contact_array.empty?
      puts "Hmm, looks like we don't have that email on record.  Let's sign up!"
      
      # Create Contact in self so don't have to do with new object creator
      CreateContact()
    else
      @id = contact_array[0]
      @first_name = contact_array[1]
      @last_name = contact_array[2]
      @email = contact_array[3]
      @view_active = contact_array[4]
    end
    
    # create an array of list objects
    cmd = <<-SQL
      select id from items where contact_id = ?
    SQL
    
    list_array = @db.execute(cmd, [@id]).flatten
    @items = []
    list_array.each do |item|
      @items.push(Item.new(item))
    end
  end
  
  def TableCheck
    create_table_cmd = <<-SQL
      create table if not exists contacts (
        id integer primary key,
        first_name varchar(75) not null,
        last_name varchar(75) not null,
        email varchar(75) not null unique,
        view_active bit
      );
    SQL
    @db.execute(create_table_cmd)
  end
  
  def CreateContact
    puts "What is your first name?"
    @first_name = gets.strip.capitalize
      
    puts "What's your last name?"
    @last_name = gets.strip.capitalize
    
    puts "What's your email?"
    
    cmd = <<-SQL
      insert into contacts (first_name, last_name, email) values (?, ?, ?)
    SQL
     
    @db.execute(cmd, [@first_name, @last_name, @email])
    @id = Contact.ContactId(@email)
    
    puts "Ok, you're signed up!"
  end
  
  def ListItems
    myString = ""

    if !@items.empty?
      # Header for items
      space_length = 16
      myString = "\n#{Contact.PhraseLength('ID', 6)}#{Contact.PhraseLength('Name', space_length)}#{Contact.PhraseLength('Description', space_length)}#{Contact.PhraseLength('Due Date', space_length)}#{Contact.PhraseLength('Complete Date', space_length)}#{Contact.PhraseLength('Score', space_length)}\n"
        
      # body for items
      @items.each do |item|
        myString += "#{Contact.PhraseLength(item.id, 6)}#{Contact.PhraseLength(item.name, space_length)}#{Contact.PhraseLength(item.description, space_length)}#{Contact.PhraseLength(item.due_date, space_length)}#{Contact.PhraseLength(item.complete_date, space_length)}#{Contact.PhraseLength(item.score, space_length)}\n"
      end
    else
      myString = "No items currently exists."
    end
    
    return myString
  end
  
  def ChangeView
    view_active = @db.execute("select view_active from contacts where id = ?", [@id]).flatten[0].to_i
    
    view_status = ""
    if view_active == 1
      view_status = "viewing only active tasks."
    else
      view_status = "viewing all tasks"
    end
  
    puts "Your are currently #{view_status}.  Would you like to switch ('Y/N')?"
    response = gets.strip.downcase
  
    if response == 'y'
      if view_active == 1 
        new_active = 0
      else
        new_active = 1
      end
      
      @db.execute("update contacts set view_active = ?", [new_active])
    end
  end
  
  def self.ContactId(email)
    db = SQLite3::Database.new("doit.db")
    sql_cmd = <<-SQL
      select id from contacts where email = ?
    SQL
    result = db.execute(sql_cmd, [email]).flatten[0].to_i
    return result
  end
  
  def self.ListItems(contactId)
    db = SQLite3::Database.new("doit.db")
    myString = ""
    
    results = db.execute("select id, name, description, due_date, complete_date from items where contact_id = ? order by due_date asc", [contactId])
    if !results.empty?
      space_length = 15
      myString = "#{Contact.PhraseLength('ID', space_length)}#{Contact.PhraseLength('Name', space_length)}#{Contact.PhraseLength('Description', space_length)}#{Contact.PhraseLength('Due Date', space_length)}#{Contact.PhraseLength('Complete Date', space_length)}#{Contact.PhraseLength('Score', space_length)}\n"
        
      results.each do |result|
        myString += "#{Contact.PhraseLength(result[0], space_length)}#{Contact.PhraseLength(result[1], space_length)}#{Contact.PhraseLength(result[2], space_length)}#{Contact.PhraseLength(result[3], space_length)}#{Contact.PhraseLength(result[4], space_length)}#{Contact.PhraseLength(result[5], space_length)}\n"
      end
    else
      myString += "Oh no, we need some things to do!"
    end
    
    return "Here are a list of your current DoIt items:\n" + myString
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
  
  def self.ContactPoints(contact_id)
    db = SQLite3::Database.new("doit.db")
    sum_of_score = db.execute("select sum(score) sum_of_score from items where contact_id = ?", [contact_id]).flatten[0].to_i
    
    puts "Your current score is #{sum_of_score}."
    return sum_of_score
  end

  def self.PhraseLength(phrase, num_of_spaces)
    phrase = phrase.to_s
    elipsis = "..."

    if phrase.length >= (num_of_spaces - elipsis.length)
      phrase = phrase[0..(num_of_spaces - 1)] + elipsis
    else
      phrase_spaces = num_of_spaces - phrase.length
      space_holder = ""
      phrase_spaces.times do space_holder += " " end
      phrase = phrase + space_holder
    end
    return phrase
  end
  
end