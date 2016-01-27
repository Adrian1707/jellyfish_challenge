require 'jellyfish'

describe JellyFish do

  let(:jellyfish) {described_class.new}
  let(:fish_tank) {double(:tank_object, fish: [])}
  let(:remote) {double(:remote_object)}

  describe '#initialize/new' do
    it 'when created has a default size of 1' do
      expect(jellyfish.size).to eq(1)
    end
  end

  describe "#set_coords" do
    xit 'should be set to position specified by remote' do
      allow(remote).to receive(:set_coords).and_return([2,4])
      remote.set_coords(jellyfish,2,4)
      expect(jellyfish.tank_position).to eq([2,4])
    end
  end

end
