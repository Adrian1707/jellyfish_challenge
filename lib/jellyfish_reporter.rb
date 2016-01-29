class JellyFishReporter

  def report_coordinates(jellyfish)
    jellyfish.tank_position.join('') + jellyfish.facing
  end

  def report_coordinates_with_lost_message(jellyfish)
    jellyfish.tank_position.join('') + jellyfish.facing + "LOST"
  end

  def output(jellyfish)
    if jellyfish.lost == true
      report_coordinates_with_lost_message(jellyfish)
    else
      report_coordinates(jellyfish)
    end
  end

end
