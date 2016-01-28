class JellyFishReporter

  def report_coordinates(jellyfish)
    jellyfish.tank_position.join('') + jellyfish.facing
  end

  def report_coordinates_with_lost_message(jellyfish)
    jellyfish.tank_position.join('') + jellyfish.facing + "LOST"
  end

end
