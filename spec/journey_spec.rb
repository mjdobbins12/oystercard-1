require 'journey'

describe Journey do
  let(:journey_a) { Journey.new("Aldgate")}
  let(:journey_b) { Journey.new }
  let(:exit_station) { double :exit_station }

  describe "#start_of_journey" do
    it "initializes with an entry station" do
      expect(journey_a.entry_station).to eq("Aldgate")
    end
  end

  describe "end_journey" do
    it "records an exit station" do
      journey_a.end_journey(exit_station)
      expect(journey_a.exit_station).to eq(exit_station)
    end
  end

  describe "#fare" do
    it "charges minimum fare for a complete journey" do
      journey_a.end_journey(exit_station)
      expect(journey_a.fare).to eq(1)
    end

    it "charges penalty fare if no entry station is recorded" do
      journey_b.end_journey(exit_station)
      expect(journey_b.fare).to eq(6)
    end
  end

end
