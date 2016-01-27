require 'tank_remote'

describe TankRemote do

  let(:remote) {described_class.new(fish_tank)}
  let(:fish_tank) {double(:tank_object, fish: [])}
  let(:jellyfish) {double(:jellyfish_object)}

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

  # describe "#set_coordinate" do
  #   it 'should place the fish on specific coordinates 2,4,North' do
  #     remote.set_coords(jellyfish,fish_tank,2,4,"North")
  #     expect(jellyfish.position).to eq([2,4],"North")
  #   end
  # end

end
