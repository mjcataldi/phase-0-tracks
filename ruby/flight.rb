module Flight
  def take_off(altitude)
    puts "Taking off and ascending until reaching #{altitude}. . ."
  end
end


class Bird
  include Flight
  
end

class Plane
  include Flight

end

class Superman
  # hehe
end

bird = Bird.new
plane = Plane.new

bird.take_off(5000)
plane.take_off(35000)