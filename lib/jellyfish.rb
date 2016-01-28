require_relative 'tank_remote'
require_relative 'tank'
require_relative 'jellyfish_reporter'

class JellyFish

  attr_reader :size, :tank_position, :facing, :x, :y, :lost, :journey_history

  def initialize(size=1)
    @size = size
    @lost = false
    @journey_history = []
  end

  def position(x,y,direction)
    @x = x
    @y = y
    @tank_position = [@x,@y]
    @facing = direction
  end

  def move(remote,tank,instructions)
    instructions.split("").each do |l|
      if l == "R" || l == "L"
        self.turn(remote,l)
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

  def turn(remote,direction)
    if direction == "R"
      @facing = remote.turn_jellyfish_clockwise(self)
    elsif direction =="L"
      @facing = remote.turn_jellyfish_anti_clockwise(self)
    end
  end

  def output(reporter)
    if @lost == true
      reporter.report_coordinates_with_lost_message(self)
    else
      reporter.report_coordinates(self)
    end
  end

"test"
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

  def no_go_zone(tank)
    tank.restricted_zones << @journey_history[-1] unless contains_no_go_zone?(tank)
  end

end


# fish = JellyFish.new
# fish2 = JellyFish.new
# tank = Tank.new
# remote = TankRemote.new(tank)
# reporter = JellyFishReporter.new
# fish.position(1,1,"N")
# fish.move(remote,tank,"FFF")
# print fish.output(reporter)
# fish2.position(1,1,"N")
# fish2.move(remote,tank,"FFFFFFFFFLLFL")
# print fish2.output(reporter)
# print tank.restricted_zones
# fish.position(1,1,"N")
# fish.move(tank,"FFF")
# fish2.position(1,1,"N")
# fish2.move(tank,"FFF")
# # print fish.journey_history
# print fish.output
# print fish2.output
