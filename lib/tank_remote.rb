require_relative 'jellyfish'

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

end
