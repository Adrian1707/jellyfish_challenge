class JellyFish

  attr_reader :size, :tank_position

  def initialize(size=1)
    @size = size
    @tank_position = []
  end

  def position(x,y)
    @tank_position = [x,y]
  end


end
