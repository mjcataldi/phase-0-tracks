require 'date'
require 'sqlite3'
require_relative 'contact'
require_relative 'item'


# # USER INTERFACE
# puts "Hey there, let's get going!"

# puts "First give me your email address:"
# email = gets.strip.downcase

# db = SQLite3::Database.new("doit.db")
# exists = Contact.ContactExists(email)

# if !exists
#   puts "Whoa, we don't have your in our records!  Let's get you signed up!"
  
#   puts "What's your first name?"
#   first_name = gets.strip
  
#   puts "What's your last name?"
#   last_name = gets.strip
  
#   db.execute("insert into contacts (first_name, last_name, email) values (?, ?, ?)", [first_name, last_name, email])
#   puts "You're now in the database!"
# end
# row_set = db.execute("select id, first_name, last_name, email from contacts where email = ?", [email])

# contact_id = row_set['id']
# first_name = row_set['first_name']
# last_name = row_set['last_name']
# email = row_set['email']
# puts "Nice to see you #{first_name} #{last_name}.  Let's get started!"

# puts "Give me the name of an item you'd like to complete:"
# name = gets.strip

# puts "If you have a longer description of the item, just indicate it here:"
# description = gets.strip

# puts "When would you like this item due ('YYYY-MM-DD')?\nBe careful: once you input a date, there's no going back!"
# date = Date.parse(gets.strip)
# myItem = DoItItem.new(name, description, date, contact_id)

# puts "Ok, we've logged your todo list item.  Here are all that we have to-date:"

# todo_items = db.execute("select * from items where contact_id = ?", [contact_id])

# puts "Item \tDescription \tDue Date"
# puts "===================================="
# todo_items.each do |item|
#   puts "#{item[name]} \t#{item[description]} \t#{due_date}"
# end

  # puts "Enter an email:"
  # email = gets.strip.downcase

  #   db = SQLite3::Database.new("doit.db")
  #   # db.results_as_hash
  #   # TableCheck(db_self)
    
  #   results = db.execute("select id from contacts where email = ?", [email])
    
  #   p results.empty?
  #   p results.class
  #   p results
  
    puts "Enter an email:"
    email = gets.strip.downcase
    
    first_name = ""
    last_name = ""
    contact_id = 0
    
    if !Contact.ContactExists(email)
      puts "Dude, doesn't look like we have you in our system ('oh no').  Let's get some information:"
      puts "What's your first name?"
      first_name = gets.strip.capitalize
      
      puts "What's your last name?"
      last_name = gets.strip.capitalize
      
      contact_id = Contact.CreateContact(first_name, last_name, email)
    else
      contact = Contact.ContactInfo(email)
      contact.flatten!
      contact_id = contact[0].to_i
      first_name = contact[1]
      last_name = contact[2]
    end
    
    puts "Awesome, your name is #{first_name} #{last_name}. \nYour email is #{email} and your id is #{contact_id}."
    contact = Contact.new(first_name, last_name, email)
    puts ""
    
    puts "Here are your current list of DoIt items:"
    puts Contact.ListItems(contact_id)