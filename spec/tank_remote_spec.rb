require 'tank_remote'
require 'jellyfish'

describe TankRemote do

  let(:remote) {described_class.new(fish_tank)}
  let(:fish_tank) {double(:tank_object, fish: [])}
  let(:jellyfish) {JellyFish.new}

  describe "initialize/new" do
    it 'should initialize with a new tank object' do
      expect(remote.tank).to eq(fish_tank)
    end

  end

  describe "#place" do
    it 'should place the jellyfish onto a position in the tank' do
      remote.place(jellyfish,fish_tank)
      expect(fish_tank.fish.first).to eq(jellyfish)
    end

  end

  describe "#set_coordinate" do
    it 'should place the fish on specific coordinates 2,4,North' do
      remote.set_coords(jellyfish,2,4)
      expect(jellyfish.tank_position).to eq([2,4])
    end
  end

  describe "#instruct_to_move" do
    it 'should move the jellyfish 1 co-ordinate across' do
      remote.place(jellyfish,fish_tank)
      remote.set_coords(jellyfish,2,2)
      remote.instruct_to_move(jellyfish,1,1)
      expect(jellyfish.tank_position).to eq([3,3])
    end
  end

end
