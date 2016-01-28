require 'tank'

describe Tank do

  let(:tank) {described_class.new}

  describe '#initialize/new' do
    it 'when created has a default size of 5x5' do
      expect(tank.size).to eq(6)
    end

    it 'should create a tank consisting arrays of coordinates' do
      expect(tank.tank_points.length).to eq(36)
    end

    it 'should have an x,y maximum value of 50,50' do
      expect(tank.tank_points.max).to eq([5,5])
    end

    it 'has no fish inside on creation' do
      expect(tank.fish).to eq([])
    end



  end

end
