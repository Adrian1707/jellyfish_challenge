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

  def set_coords(jellyfish,x,y)
    jellyfish.position(x,y)
  end

  def instruct_to_move(jellyfish,x,y)
    jellyfish.move(x,y)
  end

end

# fish = JellyFish.new
# tank = Tank.new(5)
# remote = TankRemote.new(tank)
# remote.place(fish,tank)
# remote.set_coords(fish,2,2)
# # print fish.tank_position(3,2)
# remote.instruct_to_move(fish,1,1)
# print fish.tank_position
# # remote.instruct_to_move(fish,1,3)
