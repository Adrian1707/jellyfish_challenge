class JellyFish

  attr_reader :size, :tank_position

  def initialize(size=1)
    @size = size
    @tank_position = []
  end

  def position(x,y)
    @tank_position = [x,y]
  end

  def move(x,y)
    @tank_position[0]+=x
    @tank_position[1]+=y
  end


end
