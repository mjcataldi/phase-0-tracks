# Virus Predictor

# I worked on this challenge [by myself, with: Daniel].
# We spent [2] hours on this challenge.

# EXPLANATION OF require_relative
# require_relative is a way that the source file requires another file in the same or relative directory to its own location.  This works simliar to an href attribute in an anchor tag minus the #id type.  It's a shorthand way to reference a file counter to require which needs the full absolute path of a file.
# require can handle any path, but is most typically used to reference files that are outside of the root folder scope of the referencing file.  Needs a full absolute path compared to require_relative.

require_relative 'state_data'

class VirusPredictor

  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # Organizing all the variables into one and using on the method.
  def virus_effects
    predicted_deaths(@population_density, @population, @state)
    speed_of_spread(@population_density, @state)
  end
  
  private
  
  # a method that predicts deaths is solely based on population density
  def predicted_deaths(population_density, population, state)
    
    if @population_density >= 50
      number_of_deaths = (@population * (@population_density / 500)).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end
    
    # if @population_density >= 200
    #   number_of_deaths = (@population * 0.4).floor
    # elsif @population_density >= 150
    #   number_of_deaths = (@population * 0.3).floor
    # elsif @population_density >= 100
    #   number_of_deaths = (@population * 0.2).floor
    # elsif @population_density >= 50
    #   number_of_deaths = (@population * 0.1).floor
    # else
    #   number_of_deaths = (@population * 0.05).floor
    # end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  # THIS IS INTENTIONAL, SERIOUSLY, YES.
  end

  # Adjust the speed of the virus spreading based on the density of the population.  The higher the density, the greater the speed of spread.
  def speed_of_spread(population_density, state) #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    # 
    
    speed = (2.5 - (@population_density / 100)).round(2)
    
    if speed < 0
      speed = 0
    end
    
    # speed = 0.0
    
    # if @population_density >= 200
    #   speed += 0.5
    # elsif @population_density >= 150
    #   speed += 1
    # elsif @population_density >= 100
    #   speed += 1.5
    # elsif @population_density >= 50
    #   speed += 2
    # else
    #   speed += 2.5
    # end

    puts " and will spread across the state in #{speed} months.\n"

  end

end

#=======================================================================
# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

STATE_DATA.each { |state_name, state_values|
  state_instance = VirusPredictor.new(state_name, STATE_DATA[state_name][:population_density], STATE_DATA[state_name][:population])
  state_instance.virus_effects
}
  
# myVirusPredictor = VirusPredictor.new("Illinois", 231.9, 12875255)
# myVirusPredictor.virus_effects
#=======================================================================
# Reflection Section

# 1. The differences between the two different hash syntaxes shown in the state_data file are two fold: one is a "string" =>, the other is a :symbol => "value" or symbol: value.  The strings are good when the user needs to use them in the code directly.  Symbols are good because they only point to one location in the memory instead of having to create a new location for each key compared to a string.
# 2. EXPLANATION OF require_relative
# require_relative is a way that the source file requires another file in the same or relative directory to its own location.  This works simliar to an href attribute in an anchor tag minus the #id type.  It's a shorthand way to reference a file counter to require which needs the full absolute path of a file.
# require can handle any path, but is most typically used to reference files that are outside of the root folder scope of the referencing file.  Needs a full absolute path compared to require_relative.
# 3. Some ways to iterate through a has are a while loop, a do loop, or an each iterator.
# 4. One of the things that stood out amongst the variables were that they were consistent and used the same data from the constant hash, so with commenting out 5 lines of code, the two methods could be easily combined.
# 5. The concept I most solidified in this challenge (aside from more understanding the differences between print, p and puts) is refactoring and using vector formulas to categorize data which make them more accurate.