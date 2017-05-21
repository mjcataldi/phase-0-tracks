require_relative 'contact'
require_relative 'item'
require 'SQLite3'

class Feedback
  attr_accessor :giver_id, :receiver_id, :encouragement
  attr_reader :db
  
  def initialize(giver_id, receiver_id, feedback)
    @giver_id = giver_id
    @receiver_id = receiver_id
    @feedbac
    @db = SQLite3::Database.new('doit.db')
  end

  def self.GiveFeedback(giver_id = 0, receiver_id = 0, feedback = "")
    puts "Let's give some feedback!"

    if giver_id == 0
      puts "What is the email of the person giving the feedback:"
      giver_id = Contact.ContactId(gets.strip.downcase)
    end
    
    if receiver_id == 0
      puts "What is the email of the person receiving the feedback:"
      receiver_id = Contact.ContactId(gets.strip.downcase)
    end
    
    if feedback.strip.length == 0
      puts "What is the feedback:"
      feedback = gets.strip
    end
    
    Feedback.EnsureTable
    db = SQLite3::Database.new('doit.db')
    sql_cmd = <<-SQL
      insert into feedback(giver_id, receiver_id, feedback) values (?, ?, ?)
    SQL
    db.execute(sql_cmd, [giver_id, receiver_id, feedback])
    puts "Feedback received, thank you!"
  end
  
  def self.EnsureTable
    db = SQLite3::Database.new('doit.db')
    sql_cmd = <<-SQL
      create table if not exists feedback (
        id int primary key,
        giver_id int not null references contact(id),
        receiver_id int not null references contact(id),
        feedback varchar(255) not null
      );
    SQL
    db.execute(sql_cmd)
  end
  
end