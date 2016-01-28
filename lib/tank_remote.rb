class TankRemote

  attr_reader :tank
  ORIENTATION = {"N"=>"E","E"=>"S","S"=>"W","W"=>"N"}

  def initialize(tank)
    @tank = tank
    @orientation = ORIENTATION
  end

  def place(jellyfish,tank)
    tank.fish << jellyfish
  end

  def set_coords(jellyfish,x,y,direction)
    raise "The tank is not that big. Choose a smaller coordinate" unless tank_big_enough?(@tank,x,y)
    jellyfish.position(x,y,direction)
  end

  def instruct_to_move(remote,instructions,jellyfish,mover)
    raise "Fish is currently not in the tank" unless fish_in_tank?(@tank,jellyfish)
    jellyfish.move(remote,@tank,instructions,mover)
    remove_fish_if_it_goes_beyond_tank(tank,jellyfish)
  end

  def turn_jellyfish_clockwise(jellyfish)
    fetch_keys_from_orientation(jellyfish)
    @orientation.values[@index]
  end

  def turn_jellyfish_anti_clockwise(jellyfish)
    fetch_keys_from_inverted_orientation(jellyfish)
    @orientation.invert.values[@index]
  end

  private

  def fish_in_tank?(tank,jellyfish)
    tank.fish.include? jellyfish
  end

  def tank_big_enough?(tank,x,y)
    tank.tank_points.include? [x,y]
  end

  def remove_fish_if_it_goes_beyond_tank(tank,jellyfish)
    unless tank.tank_points.include? jellyfish.tank_position
      tank.fish.delete(jellyfish)
    end
  end

  def fetch_keys_from_orientation(jellyfish)
    @keys = @orientation.keys
    @index = @keys.index(jellyfish.facing)
  end

  def fetch_keys_from_inverted_orientation(jellyfish)
    @keys = @orientation.invert.keys
    @index = @keys.index(jellyfish.facing)
  end

end
