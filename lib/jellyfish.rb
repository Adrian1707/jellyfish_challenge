class JellyFish

  attr_reader :size, :tank_position, :facing, :lost, :journey_history, :direction
  attr_accessor :x, :y

  def initialize(size=1)
    @size = size
    @journey_history = []
  end

  def position(x,y,direction)
    @x = x
    @y = y
    @tank_position = [@x,@y]
    @facing = direction
  end

  def move(remote,tank,instructions,mover)
    instructions.split("").each do |l|
      @direction = l
      take_direction_and_send_to_turn_method(remote)
      call_move_methods(remote,tank,instructions,mover)
      set_to_lost_if_outside_tank(tank)
    end
    set_new_tank_position
  end

  def turn(remote)
    if @direction == "R"
      @facing = remote.turn_jellyfish_clockwise(self)
    elsif @direction =="L"
      @facing = remote.turn_jellyfish_anti_clockwise(self)
    end
  end

  private

  def inside_tank?(tank)
    tank.tank_points.include? [@x,@y]
  end

  def take_direction_and_send_to_turn_method(remote)
    if @direction == "R" || @direction == "L"
      self.turn(remote)
    end
  end

  def set_to_lost_if_outside_tank(tank)
    if inside_tank?(tank) == false
      @lost = true
      no_go_zone(tank)
    end
  end

  def call_move_methods(remote,tank,instructions,mover)
    mover.move_north(remote,tank,instructions,self)
    mover.move_south(remote,tank,instructions,self)
    mover.move_east(remote,tank,instructions,self)
    mover.move_west(remote,tank,instructions,self)
  end

  def contains_no_go_zone?(tank)
    tank.restricted_zones.include? @journey_history[-1]
  end

  def no_go_zone(tank)
    tank.restricted_zones << @journey_history[-1] unless contains_no_go_zone?(tank)
  end

  def set_new_tank_position
    @tank_position = [@x,@y]
  end 

end
