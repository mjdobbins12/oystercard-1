class Station
  attr_reader :name
  attr_reader :zone

  def initialize(name = "Clapham", zone)
    @zone = zone
    @name = name
  end
end
