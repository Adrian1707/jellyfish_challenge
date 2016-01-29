#!/usr/bin/env ruby


require_relative "lib/tank"
require_relative "lib/jellyfish"
require_relative "lib/jellyfish_mover"
require_relative "lib/jellyfish_reporter"
require_relative "lib/tank_remote"

# fish = JellyFish.new
# fish2 = JellyFish.new
# tank = Tank.new(5,3)
# remote = TankRemote.new(tank)
# reporter = JellyFishReporter.new
# mover = JellyFishMover.new
# remote.place(fish)
# remote.set_coords(fish,1,1,"N")
# remote.instruct_to_move("FFFFFLL",fish,mover)
# print reporter.output(fish)

input = File.open('jellyfish_positions.txt').read

input_arr = input.split('\n')[0].split(' ')

num_of_fish = input_arr.count/2
tank = Tank.new(input_arr[0][1].to_i,input_arr[0][0].to_i)

input_arr.shift
# print input_arr

fish_positions = []
fish_instructions = []

input_arr.each_index{|index|
    fish_positions << input_arr[index] if index % 2 == 0
    fish_instructions << input_arr[index] if index % 2 != 0
}

puts "input processing"
puts "-"*20
print input
puts "\n"
puts "output"
puts "-"*20
num_of_fish.times do |i|
  fish = JellyFish.new
  reporter = JellyFishReporter.new
  mover = JellyFishMover.new
  remote = TankRemote.new(tank)
  remote.place(fish)
  remote.set_coords(fish,fish_positions[i][0].to_i, fish_positions[i][1].to_i,fish_positions[i][2])
  remote.instruct_to_move(fish_instructions[i],fish,mover)
  print "#{reporter.output(fish)}\n"
end
