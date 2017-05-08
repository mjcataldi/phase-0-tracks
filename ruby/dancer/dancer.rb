class Dancer
  attr_accessor :age
  attr_reader :name, :card
  
  def initialize(name, age)
    @name = name
    @age = age
    @card = []
  end

  def pirouette
    "*twirls*"
  end

  def bow
    "*bows*"
  end
  
  def sweat
    "*sweat*"
  end

  def queue_dance_with(dancer_name)
    @card << dancer_name
    dancer_name
  end

  def begin_next_dance
    current_dance_partner = @card[0]
    @card.delete(current_dance_partner)
    "Now dancing with #{current_dance_partner}."
  end

end