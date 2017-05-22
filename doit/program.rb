require 'date'
require_relative 'contact'
require_relative 'item'
require_relative 'feedback'

def UserInterface
  puts "Hello!  Let's get started."
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
  
  puts contact.ListItems
  repeat = true
  puts ""
  
  while repeat
    puts "\nWhat would you like to do today:\nPress '1' to add a new item\nPress '2' to mark item finished\nPress '3' to see sum of score\nPress '4' to leave feedback\nPress '5' to exit."
    answer = gets.strip.to_i
    
    case answer
      when 1
        DoItItem.InsertItemUser(contact.id)
      when 2
        DoItItem.MarkComplete(contact.id)
      when 3
        Contact.ContactPoints(contact.id)
      when 4
        Feedback.GiveFeedback(contact.id) 
      when 5
        puts "See ya!"
        repeat = false
      else
        puts "Hmm, I didn't get that.  Let's try that again."
    end
  end
  
end

UserInterface()