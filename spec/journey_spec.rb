require 'journey'

describe Journey do
  let(:journey_a) { Journey.new }
  let(:entry_station) { Station.new }
  let(:exit_station) { Station.new }
  let(:name) {double :name}
  let(:zone_a) {1}
  let(:zone_b) {6}

  describe "#fare" do
    it "charges relevant fare for a complete journey" do
      journey_a.entry_station.name = name
      journey_a.exit_station.name = name
      journey_a.entry_station.zone = zone_a
      journey_a.exit_station.zone = zone_b
      expect(journey_a.fare).to eq(6)
    end

    it "charges penalty fare if no entry station is recorded" do
      journey_a.exit_station = exit_station
      expect(journey_a.fare).to eq(6)
    end
  end

end
