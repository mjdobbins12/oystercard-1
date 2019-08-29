require 'journey'

describe Journey do
  let(:journey_a) { Journey.new }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  describe "#fare" do
    it "charges minimum fare for a complete journey" do
      journey_a.entry_station = entry_station
      journey_a.exit_station = exit_station
      expect(journey_a.fare).to eq(1)
    end

    it "charges penalty fare if no entry station is recorded" do
      journey_a.exit_station = exit_station
      expect(journey_a.fare).to eq(6)
    end
  end

end
