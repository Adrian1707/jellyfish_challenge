require_relative 'tank'
class JellyFish

  attr_reader :size, :tank_position, :facing, :x, :y, :lost, :journey_history
  ORIENTATION = {"N"=>"E","E"=>"S","S"=>"W","W"=>"N"}

  def initialize(size=1)
    @size = size
    @orientation = ORIENTATION
    @lost = false
    @journey_history = []
  end

  def position(x,y,direction)
    @x = x
    @y = y
    @tank_position = [@x,@y]
    @facing = direction
  end

  def move(tank,instructions)
    instructions.split("").each do |l|
      if l == "R" || l == "L"
        self.turn(l)
      end
      if l == "F" && @facing == "N"
        @y = @y+=1 unless tank.restricted_zones.include? [@x,@y+1]
        record_journey_history
      elsif l == "F" && @facing == "S"
        @y = @y-=1 unless tank.restricted_zones.include? [@x,@y-1]
        record_journey_history
      elsif l == "F" && @facing == "E"
        @x = @x+=1 unless tank.restricted_zones.include? [@x+1,@y]
        record_journey_history
      elsif l == "F" && @facing == "W"
        @x = @x-=1 unless tank.restricted_zones.include? [@x-1,@y]
        record_journey_history
      end
      set_to_lost_if_outside_tank(tank)
    end
    @tank_position = [@x,@y]
  end

  def turn(direction)
    if direction == "R"
      turn_jellyfish_clockwise
    elsif direction =="L"
      turn_jellyfish_anti_clockwise
    end
  end

  def output
    if @lost == true
      report_coordinates_with_lost_message
    else
      report_coordinates
    end
  end


  private

  def inside_tank?(tank)
    tank.tank_points.include? [@x,@y]
  end

  def set_to_lost_if_outside_tank(tank)
    if inside_tank?(tank) == false
      @lost = true
      no_go_zone(tank)
    end
  end

  def contains_no_go_zone?(tank)
    tank.restricted_zones.include? @journey_history[-1]
  end

  def record_journey_history
    @journey_history << [@x,@y]
  end

  def report_coordinates
    @tank_position.join('') + @facing
  end

  def report_coordinates_with_lost_message
    @tank_position.join('') + @facing + "LOST"
  end

  def no_go_zone(tank)
    tank.restricted_zones << @journey_history[-1] unless contains_no_go_zone?(tank)
  end

  def turn_jellyfish_clockwise
    fetch_keys_from_orientation
    @facing = @orientation.values[@index]
  end

  def turn_jellyfish_anti_clockwise
    fetch_keys_from_inverted_orientation
    @facing = @orientation.invert.values[@index]
  end

  def fetch_keys_from_orientation
    @keys = @orientation.keys
    @index = @keys.index(@facing)
  end

  def fetch_keys_from_inverted_orientation
    @keys = @orientation.invert.keys
    @index = @keys.index(@facing)
  end

end
#
fish = JellyFish.new
fish2 = JellyFish.new
tank = Tank.new
fish.position(1,1,"N")
fish.move(tank,"FFF")
print fish.output
fish2.position(1,1,"N")
fish2.move(tank,"FFFFFFFFFLLFL")
# print fish.output
print fish2.output
# print tank.restricted_zones
# fish.position(1,1,"N")
# fish.move(tank,"FFF")
# fish2.position(1,1,"N")
# fish2.move(tank,"FFF")
# # print fish.journey_history
# print fish.output
# print fish2.output
