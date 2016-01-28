class JellyFish

  attr_reader :size, :tank_position, :facing, :x, :y

  ORIENTATION = {"N"=>"E","E"=>"S","S"=>"W","W"=>"N"}

  def initialize(size=1)
    @size = size
    @orientation = ORIENTATION
  end

  def position(x,y,direction)
    @x = x
    @y = y
    @tank_position = [@x,@y]
    @facing = direction
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
    return output
  end

  def turn(direction)
    if direction == "R"
      turn_jellyfish_clockwise
    elsif direction =="L"
      turn_jellyfish_anti_clockwise
    end
  end

  def output
    @tank_position.join('') + @facing
  end

  private

  def turn_jellyfish_clockwise
    fetch_keys_from_orientation
    @facing = @orientation.values[@index]
  end

  def turn_jellyfish_anti_clockwise
    fetch_keys_from_inverted_orientation
    @facing = @orientation.invert.values[@index]
  end

  def fetch_keys_from_orientation
    @keys = @orientation.keys
    @index = @keys.index(@facing)
  end

  def fetch_keys_from_inverted_orientation
    @keys = @orientation.invert.keys
    @index = @keys.index(@facing)
  end
end

# fish = JellyFish.new
# fish.position(1,1,"E")
# print fish.move("RFRFRFRF")
