require 'jellyfish'

describe JellyFish do

  let(:jellyfish) {described_class.new}
  let(:fish_tank) {Tank.new(5)}
  let(:remote) {TankRemote.new(fish_tank)}

  describe '#initialize/new' do
    it 'when created has a default size of 1' do
      expect(jellyfish.size).to eq(1)
    end
  end

  describe "#tank_position" do
    it 'should be set to position specified by remote' do
      remote.set_coords(fish_tank,jellyfish,2,4)
      expect(jellyfish.tank_position).to eq([2,4])
    end
  end

  describe "#facing" do
    it 'should be facing North when initially placed in tank' do
      remote.set_coords(fish_tank,jellyfish,2,4)
      expect(jellyfish.facing).to eq "N"
    end
  end

  describe "#turn" do
    it 'should turn left to face East when L is pressed' do
    remote.set_coords(fish_tank,jellyfish,2,4)
    jellyfish.turn("L")
    expect(jellyfish.facing).to eq("W")
    end
  end

end
