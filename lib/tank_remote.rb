require_relative 'jellyfish'
require_relative 'tank'

class TankRemote

  attr_reader :tank

  def initialize(tank)
    @tank = tank
  end

  def place(jellyfish,tank)
    tank.fish << jellyfish
  end

  def set_coords(tank,jellyfish,x,y,direction)
    raise "The tank is not that big. Choose a smaller coordinate" unless tank_big_enough?(tank,x,y)
    jellyfish.position(x,y,direction)
  end

  def instruct_to_move(tank,jellyfish,instructions)
    raise "Fish is currently not in the tank" unless fish_in_tank?(tank,jellyfish)
    jellyfish.move(instructions)
    remove_fish_if_it_goes_beyond_tank(tank,jellyfish)
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

end
# #
# fish = JellyFish.new
# tank = Tank.new(5)
# remote = TankRemote.new(tank)
# # # print tank.tank_points
# # # # print tank.tank_points.include? [1,2]
# remote.place(fish,tank)
# remote.set_coords(tank,fish,2,2)
# # print fish.tank_position
# remote.instruct_to_move(tank,fish,10,10)
# # remote.instruct_to_move(fish,1,3)
