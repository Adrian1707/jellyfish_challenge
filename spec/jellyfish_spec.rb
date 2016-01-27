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

  describe "#set_coords" do
    it 'should be set to position specified by remote' do
      remote.set_coords(fish_tank,jellyfish,2,4)
      expect(jellyfish.tank_position).to eq([2,4])
    end
  end

end
