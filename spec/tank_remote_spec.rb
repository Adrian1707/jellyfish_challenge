require 'tank_remote'

describe TankRemote do

  let(:remote) {described_class.new(fish_tank)}

  describe "initialize/new" do
    let(:fish_tank) {double(:tank_object)}

    it 'should initialize with a new tank object' do
      expect(remote.tank).to eq(fish_tank)
    end
  end

  describe "#place" do
    let(:jellyfish) {double(:jellyfish_object)}
    let(:fish_tank) {double(:tank_object)}

    it 'should place the jellyfish onto a position in the tank' do
      allow(fish_tank).to receive(:fish).and_return([])
      remote.place(jellyfish,fish_tank)
      expect(fish_tank.fish.first).to eq(jellyfish)
    end

  end
end
