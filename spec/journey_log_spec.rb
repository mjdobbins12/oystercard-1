require 'journey_log'

describe JourneyLog do
  let(:journey) {Journey.new}
  let(:entry_station) {double :entry_station}
  let(:zone) {double :zone}


  describe "#initialize" do
    it "expects JourneyLog instances to initialize with an empty array called log" do
      expect(subject.log).to eq([])
    end
  end

  describe "#start" do
    it "creates new instance of Journey class with entry_station set" do
      subject.start(entry_station, zone)
      expect(subject.current_journey.entry_station.name).to eq(entry_station)
    end
  end
end