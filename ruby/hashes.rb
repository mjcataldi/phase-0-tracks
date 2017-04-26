#Interior Designer

class Client
  # This is the Client class.  It stores accesible properties about the client and has two methods: the initial questionaire and the edit answers.  Edit can be accessed on it's own, but is also accessed from the initial questionaire. 
  
  # attr_accessor :client_name, :client_age, :client_children, 
  #               :client_decor, :client_rush,
  #               :client_info

  def initialize
    @@count += 1
  end
  
  def self.count
    @@count
  end
  
  # def initialize(client_name)
  #   @client_name = client_name
  # end
  
  def client_name
    @client_name = client_name
  end
  
  def client_age
    @client_age = client_age
  end
  
  def client_children
    @client_children = client_children
  end

  def client_decor
    @client_decor = client_decor
  end
  
  def client_rush
    @client_rush = client_rush
  end
  
  def client_info
    @client_info
  end

  def clientQuestionaire
    # CLIENT INFORMATION
      # Name
      # Age
      # Number of Children
      # Decor Theme
      # Rush Process
      
    puts "What is the client's name?"
    @client_name = gets.strip.capitalize
    
    puts "What is the client's age?"
    @client_age = gets.strip.to_i
    
    puts "How many children does the client have?"
    @client_children = gets.strip.to_i
    
    puts "What is the client's decor theme?"
    @client_decor = gets.strip
    
    puts "Is this a rush process ('True'/'False')?"
    @client_rush = gets.strip.capitalize

    @client_info = {
      :client_name => @client_name,
      :client_age => @client_age,
      :client_children => @client_children,
      :client_decor => @client_decor,
      :client_rush => @client_rush
    }
    
    puts "Here is the information that was entered:"
    client_info.each do |key, value| 
      puts "\t#{value}"
    end
    
    puts "Would you like to edit any of the answers ('True' or 'False')?"
    client_edit = gets.strip.downcase
    
    if client_edit == "true" || client_edit == "t" || client_edit == "yes" || client_edit == "y"
      editAnswers
    end
  end
  
  # private
  def editAnswers
    answered = false
    
    # if !answered
    #   label :repeat
    
    while !answered
      puts "Which part would you like to edit ('Name', 'Age', 'Children', 'Decor', 'Rush')?"
      client_key = gets.strip.downcase
      
      puts "The current value of #{client_key.capitalize} is #{@client_info[client_key]}.  What do you wish to change it to?"
      client_value = gets.strip
      
      case client_key
        when "name"
          @client_info[:client_name] = client_value.capitalize
          answered = true
        when "age"
          @client_info[:client_age] = client_value.to_i
          answered = true
        when "children"
          @client_info[:client_children] = client_value.to_i
          answered = true
        when "decor"
          @client_info[:client_decor] = client_value.capitalize
          answered = true
        when "rush"
          @client_info[:client_rush] = client_value.capitalize
          answered = true
        else
          puts "Hmm, I didn't quite understand that.  Let's try that again."
          # goto :repeat
      end
      
      puts "Awesome!  Here are your updated values"
      @client_info.each do |key, value| puts "#{key.to_s.sub(/client_/, "").capitalize}:\t#{value}" end
    
    end
  end
end

my_new_client = Client.new
my_new_client.clientQuestionaire
