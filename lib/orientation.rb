@orientation = {"N"=>"E","E"=>"S","S"=>"W","W"=>"N"}


@facing = "N"

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

print turn "L"
