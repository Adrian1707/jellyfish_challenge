require 'tank'

describe Tank do
  describe '#initialize/new' do
    it 'when created has a default size of 50' do
      expect(subject.size).to eq(50)
    end
  end

end
