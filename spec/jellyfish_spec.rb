require 'jellyfish'

describe JellyFish do

  let(:jellyfish) {described_class.new}

  describe '#initialize/new' do
    it 'when created has a default size of 1' do
      expect(jellyfish.size).to eq(1)
    end

  end

end
