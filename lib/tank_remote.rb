class TankRemote

  attr_reader :tank

  def initialize(tank)
    @tank = tank
  end

  def place(jellyfish,tank)
    tank.fish << jellyfish
  end

end
