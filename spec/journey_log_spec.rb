require 'journey_log'

describe JourneyLog do
  
  describe "#initialize" do
    it "expects JourneyLog instances to initialize with an empty array called log" do
      expect(subject.log).to eq([])
    end
  end

end