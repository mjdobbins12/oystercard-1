require 'journey_log'

describe JourneyLog do
  let(:journey) {Journey.new}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}
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

  describe "#finish" do
    it "sets exit_station" do
      subject.finish(exit_station,zone)
      expect(subject.current_journey.exit_station.name).to eq(exit_station)
    end

    it "sets exit zone" do
      subject.finish(exit_station,zone)
      expect(subject.current_journey.exit_station.zone).to eq(zone)
    end

    it "adds journey to log" do
      subject.finish(exit_station,zone)
      expect(subject.log[-1][:exit_station]).to eq(exit_station)
    end
  end

  describe "journeys" do
    it "puts a list of completed journeys, saved to log" do
      subject.start(entry_station,zone)
      subject.finish(exit_station,zone)
      expect{subject.journeys}.to output("#{entry_station} to #{exit_station}\n").to_stdout
    end
  end

end