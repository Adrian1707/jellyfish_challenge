require 'tank'

describe Tank do

  let(:tank) {described_class.new}
  let(:jellyfish) {JellyFish.new}

  describe '#initialize/new' do
    it 'when created has a default size of 5x3' do
      expect(tank.height).to eq(4)
      expect(tank.width).to eq(6)
    end

    it 'should create a tank consisting arrays of coordinates' do
      expect(tank.tank_points.length).to eq(24)
    end

    it 'should have an x,y maximum value of 5,3' do
      expect(tank.tank_points.max).to eq([5,3])
    end

    it 'has no fish inside on creation' do
      expect(tank.fish).to eq([])
    end
  end

  describe "#restricted_zones" do
    it 'should keep track of restricted zones' do
      jellyfish.position(1,1,"N")
      jellyfish.move(tank,"FFF")
      jellyfish.no_go_zone(tank)
      expect(jellyfish.lost).to be true
      expect(tank.restricted_zones).to eq([[1,4]])
    end
  end

end
