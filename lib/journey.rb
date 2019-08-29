require_relative './station'

class Journey

PENALTY_FARE = 6
MINIMUM_FARE = 1

attr_accessor :entry_station, :exit_station

def initialize
  @entry_station = Station.new
  @exit_station = Station.new
end

def fare
  @entry_station.name == nil || @exit_station.name == nil ? PENALTY_FARE : fare_calculator
end

def fare_calculator
  (@entry_station.zone - @exit_station.zone).abs + 1
end

end
