require_relative 'contact'
require_relative 'item'
require 'SQLite3'

class Feedback
  attr_accessor :giver_id, :receiver_id, :encouragement
  attr_reader :db
  
  
  def initialize(giver_id, receiver_id, feedback)
    @giver_id = giver_id
    @receiver_id = receiver_id
    @feedback = feedback
    @db = SQLite3::Database.new('doit.db')
  end

  def self.GiveFeedback(giver_id, receiver_id, feedback)
    Feedback.EnsureTable
    db = SQLite3::Database.new('doit.db')
    sql_cmd = <<-SQL
      insert into feedback(giver_id, receiver_id, feedback) values (?, ?, ?)
    SQL
    
    db.execute(sql_cmd, [giver_id, receiver_id, feedback])
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