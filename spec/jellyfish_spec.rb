require 'jellyfish'

describe JellyFish do

  let(:jellyfish) {described_class.new}
  let(:fish_tank) {Tank.new}
  let(:remote) {TankRemote.new(fish_tank)}

  describe '#initialize/new' do
    it 'when created has a default size of 1' do
      expect(jellyfish.size).to eq(1)
    end
  end

  describe "#tank_position" do
    it 'should be set to position specified by remote' do
      remote.set_coords(fish_tank,jellyfish,2,3,"N")
      expect(jellyfish.tank_position).to eq([2,3])
    end
  end

  describe "#turn" do
    it 'should turn left to face East when L is pressed and initially facing North' do
    remote.set_coords(fish_tank,jellyfish,2,3,"N")
    jellyfish.turn("L")
    expect(jellyfish.facing).to eq("W")
    end
  end

  describe "#lost" do
    it 'should report as "LOST" if it goes outside the tank at any point' do
      remote.place(jellyfish,fish_tank)
      remote.set_coords(fish_tank,jellyfish,3,2,"N")
      remote.instruct_to_move(fish_tank,jellyfish,"FRRFLLFFRRFLL")
      expect(jellyfish.lost).to be true
    end
  end

end
