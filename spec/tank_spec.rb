require 'tank'

describe Tank do
  describe '#initialize/new' do
    it 'when created has a default size of 50' do
      expect(subject.size).to eq(51)
    end

    it 'should create a tank consisting arrays of coordinates' do
      expect(subject.tank_points.length).to eq(2601)
    end

    it 'should have an x,y maximum value of 50,50' do
      expect(subject.tank_points.max).to eq([50,50])
    end
  end

end
