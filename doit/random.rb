require 'sqlite3'


class MyObject
  def initialize()
    
  end
  
  def SayHello(name)
    puts "Hello #{name}."
  end
  
  def GetId(email)
    db = SQLite3::Database.new("doit.db")
    cmd = <<-SQL
      select id from contacts where email = ?
    SQL
    return db.execute(cmd, [email]).flatten[0].to_i
  end
  
end

myDude = MyObject.new()
myDude.SayHello("Matthew")
puts myDude.GetId('caponecataldi@gmail.com')
