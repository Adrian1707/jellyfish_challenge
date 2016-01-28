require 'jellyfish'
require 'jellyfish_mover'

describe JellyFish do

  let(:jellyfish) {described_class.new}
  let(:fish_tank) {Tank.new}
  let(:remote) {TankRemote.new(fish_tank)}
  let(:reporter) {JellyFishReporter.new}
  let(:mover){JellyFishMover.new}

  describe '#initialize/new' do
    it 'when created has a default size of 1' do
      expect(jellyfish.size).to eq(1)
    end

    it 'should have a journey history array set' do
      expect(jellyfish.journey_history).to eq([])
    end
  end

  describe "#tank_position" do
    it 'should be set to position specified by remote' do
      remote.set_coords(fish_tank,jellyfish,2,3,"N")
      expect(jellyfish.tank_position).to eq([2,3])
    end
  end

  describe "#turn" do
    it 'should turn left to face East when L is pressed and initially facing North' do
    remote.set_coords(fish_tank,jellyfish,2,3,"N")
    jellyfish.turn(remote,"L")
    expect(jellyfish.facing).to eq("W")
    end
  end

  describe "#move" do
    it 'should make a record of all the moves made by the jellyfish' do
      jellyfish.position(1,1,"N")
      jellyfish.move(remote,fish_tank,"FFRF",mover)
      expect(jellyfish.journey_history).to eq([[1,2],[1,3],[2,3]])
    end

    it 'should make a record of complex moves' do
      jellyfish.position(1,1,"N")
      jellyfish.move(remote,fish_tank,"LLLFFLFFFRRFF",mover)
      expect(jellyfish.journey_history).to eq([[2,1],[3,1],[3,2],[3,3],[3,4],[3,3],[3,2]])
    end

    it 'should not allow the jellyfish to move if the target position is in the no go zones' do
      jellyfish2 = JellyFish.new
      jellyfish.position(1,1,"N")
      jellyfish.move(remote,fish_tank,"FFF",mover)
      jellyfish2.position(1,1,"N")
      jellyfish2.move(remote,fish_tank,"FFF",mover)
      expect(jellyfish2.output(reporter)).to eq("13N")
    end
  end

  describe "#lost" do
    it 'should report as "LOST" if it goes outside the tank at any point' do
      remote.place(jellyfish,fish_tank)
      remote.set_coords(fish_tank,jellyfish,3,2,"N")
      remote.instruct_to_move(remote,fish_tank,"FRRFLLFFRRFLL",jellyfish,mover)
      expect(jellyfish.lost).to be true
    end
  end

end
