require 'tank_remote'
require 'jellyfish'

describe TankRemote do

  let(:remote) {described_class.new(fish_tank)}
  let(:fish_tank) {Tank.new(5)}
  let(:jellyfish) {JellyFish.new}

  describe "initialize/new" do
    it 'should initialize with a new tank object' do
      expect(remote.tank).to eq(fish_tank)
    end

  end

  describe "#place" do
    it 'should place the jellyfish onto a position in the tank' do
      remote.place(jellyfish,fish_tank)
      expect(fish_tank.fish).to include(jellyfish)
    end

  end

  describe "#set_coordinate" do
    it 'should place the fish on specific coordinates 2,4' do
      remote.set_coords(fish_tank,jellyfish,2,4)
      expect(jellyfish.tank_position).to eq([2,4])
    end

    it 'should raise error is coordinate is not in the tank' do
      expect{remote.set_coords(fish_tank,jellyfish,10,10)}.to raise_error "The tank is not that big. Choose a smaller coordinate"
    end
  end

  describe "#instruct_to_move" do
    it 'should move the jellyfish 1 co-ordinate across' do
      remote.place(jellyfish,fish_tank)
      remote.set_coords(fish_tank,jellyfish,2,2)
      remote.instruct_to_move(fish_tank,jellyfish,1,1)
      # expect(remote.instruct_to_move(fish_tank,jellyfish,1,1)).to eq(3)
      expect(jellyfish.tank_position).to eq([3,3])
    end

    it 'should raise an error if fish is not in the tank' do
      expect{remote.instruct_to_move(fish_tank,jellyfish,1,1)}.to raise_error "Fish is currently not in the tank"
    end

    xit 'should set the jellyfish to lost if it moves out of the tank' do
      remote.place(jellyfish,fish_tank)
      remote.set_coords(fish_tank,jellyfish,2,2)
      remote.instruct_to_move(fish_tank,jellyfish,10,10)
      expect(fish_tank.fish).not_to include(jellyfish)
    end
  end

end
