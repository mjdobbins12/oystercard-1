require './lib/station.rb'

describe Station do
  let(:station) { double(name: "Clapham", zone: 3) }
  it "initializes with a name" do
    expect(station.name).to_not be(nil)
  end
  it "initializes with a zone" do
    expect(station.zone).to_not be(nil)
  end
end
