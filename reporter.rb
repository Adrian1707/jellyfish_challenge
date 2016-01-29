#!/usr/bin/env ruby
require_relative "lib/tank"
require_relative "lib/jellyfish"
require_relative "lib/jellyfish_mover"
require_relative "lib/jellyfish_reporter"
require_relative "lib/tank_remote"

def set_up
  read_file_and_set_data_to_array
  @num_of_fish = @input_arr.count/2
  @tank = Tank.new(@input_arr[0][1].to_i,@input_arr[0][0].to_i)
  @input_arr.shift
  create_new_arrays_of_positions_and_instructions
end

def read_file_and_set_data_to_array
  @input = File.open('jellyfish_positions.txt').read
  @input_arr = @input.split('\n')[0].split(' ')
end

def create_new_arrays_of_positions_and_instructions
  @fish_positions = []
  @fish_instructions = []
  @input_arr.each_index do |index|
      @fish_positions << @input_arr[index] if index % 2 == 0
      @fish_instructions << @input_arr[index] if index % 2 != 0
  end
end

def create_new_instances
  @mover = JellyFishMover.new
  @remote = TankRemote.new(@tank)
  @fish = JellyFish.new
  @reporter = JellyFishReporter.new
end

def place_and_move_jellyfish
  @remote.place(@fish)
  @remote.set_coords(@fish,@fish_positions[@index][0].to_i, @fish_positions[@index][1].to_i,@fish_positions[@index][2])
  @remote.instruct_to_move(@fish_instructions[@index],@fish,@mover)
end

def print_output
  @num_of_fish.times do |i|
    @index = i
    create_new_instances
    place_and_move_jellyfish
    print "#{@reporter.output(@fish)}\n"
  end
end

set_up
puts "input processing"
puts "-"*20
print "#{@input}\n"
puts "output"
puts "-"*20
print_output
