class JellyFish

  attr_reader :size, :tank_position, :facing, :x, :y

  ORIENTATION = {"N"=>"E","E"=>"S","S"=>"W","W"=>"N"}

  def initialize(size=1)
    @size = size
    @orientation = ORIENTATION
  end

  def position(x,y)
    @x = x
    @y = y
    @tank_position = [@x,@y]
    @facing = "N"
  end

  def move(instructions)
    instructions.split("").each do |l|
      if l == "R" || l == "L"
      self.turn(l)
      end
      if l == "F" && @facing == "N"
        @y = @y+=1
      elsif l == "F" && @facing == "S"
        @y = @y-=1
      elsif l == "F" && @facing == "E"
        @x = @x+=1
      elsif l == "F" && @facing == "W"
        @x = @x-=1
      end
    end
    @tank_position = [@x,@y]
  end

  def turn(direction)
      if direction == "R"
        @keys = @orientation.keys
        index = @keys.index(@facing)
        @facing = @orientation.values[index]
      elsif direction =="L"
        @keys = @orientation.invert.keys
        index = @keys.index(@facing)
        @facing = @orientation.invert.values[index]
      end
  end

end

# fish = JellyFish.new
# fish.position(2,2)
# fish.move("FLFLF")
# print fish.tank_position
