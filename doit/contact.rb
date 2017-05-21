require 'date'
require_relative 'item'

class Contact
  attr_accessor :first_name, :last_name, :email
  attr_reader :id, :db, :list
  
  def initialize(first_name, last_name, email)
    @db = SQLite3::Database.new("doit.db")

    @first_name = first_name.strip
    @last_name = last_name.strip
    @email = email.strip
    
    TableCheck()
    CreateContact()
    @list = @db.execute("select id, name, description, due_date, complete_date from items where contact_id = ? order by due_date", [@id])
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
  
  def self.ContactId(email)
    db = SQLite3::Database.new("doit.db")
    sql_cmd = <<-SQL
      select id from contacts where email = ?
    SQL
    result = db.execute(sql_cmd, [email]).flatten[0].to_i
    return result
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

    if !@list.empty?
      @list.each do |item|
        myString += "#{item[0]}\t#{item[1]} - #{item[2]}\t#{item[3]}\t#{item[4]}\n"
      end
    else
      myString = "No items currently exists."
    end
    
    return myString
  end
  
  
  def self.ListItems(contactId)
    db = SQLite3::Database.new("doit.db")
    db.results_as_hash()
    myString = ""
    
    results = db.execute("select id, name, description, due_date, complete_date from items where contact_id = ? order by due_date asc", [contactId])
    if !results.empty?
      counter = 1
      results.each do |result|
        myString += "#{counter}. (ID#: #{result[0]})\t#{result[1]}\t#{result[2]}\t#{result[3]}\t#{result[4]}\n"
        counter += 1
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
  
end