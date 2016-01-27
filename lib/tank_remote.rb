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

  def set_coords(tank,jellyfish,x,y)
    raise "The tank is not that big. Choose a smaller coordinate" unless tank_big_enough?(tank,x,y)
    jellyfish.position(x,y)
  end

  def instruct_to_move(tank,jellyfish,x,y)
    raise "Fish is currently not in the tank" unless fish_in_tank?(tank,jellyfish)
    jellyfish.move(x,y)
  end

  private

  def fish_in_tank?(tank,jellyfish)
    tank.fish.include? jellyfish
  end

  def tank_big_enough?(tank,x,y)
    tank.tank_points.include? [x,y]
  end

end
#
# fish = JellyFish.new
# tank = Tank.new(5)
# remote = TankRemote.new(tank)
# print tank.tank_points
# print tank.tank_points.include? [1,2]
# remote.place(fish,tank)
# remote.set_coords(fish,2,2)
# print fish.tank_position(3,2)
# remote.instruct_to_move(tank,fish,1,1)
# print fish.tank_position
# remote.instruct_to_move(fish,1,3)
