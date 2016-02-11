class JellyFishMover

  def move_north(remote,tank,instructions,jellyfish)
    if jellyfish.direction == "F" && jellyfish.facing == "N"
      jellyfish.y = jellyfish.y+=1 unless tank.restricted_zones.include? [jellyfish.x,jellyfish.y+1]
      record_journey_history(jellyfish)
    end
  end

  def move_south(remote,tank,instructions,jellyfish)
    if jellyfish.direction == "F" && jellyfish.facing == "S"
      jellyfish.y = jellyfish.y-=1 unless tank.restricted_zones.include? [jellyfish.x,jellyfish.y-1]
      record_journey_history(jellyfish)
    end
  end

  def move_east(remote,tank,instructions,jellyfish)
    if jellyfish.direction == "F" && jellyfish.facing == "E"
      jellyfish.x = jellyfish.x+=1 unless tank.restricted_zones.include? [jellyfish.x+1,jellyfish.y]
      record_journey_history(jellyfish)
    end
  end

  def move_west(remote,tank,instructions,jellyfish)
    if jellyfish.direction == "F" && jellyfish.facing == "W"
      jellyfish.x = jellyfish.x-=1 unless tank.restricted_zones.include? [jellyfish.x-1,jellyfish.y]
      record_journey_history(jellyfish)
    end
  end

  private

  def record_journey_history(jellyfish)
    jellyfish.journey_history << [jellyfish.x,jellyfish.y]
  end

end
