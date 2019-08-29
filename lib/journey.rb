class Journey

PENALTY_FARE = 6
MINIMUM_FARE = 1

attr_accessor :entry_station, :exit_station

def initialize
  @entry_station = nil
  @exit_station = nil
end

def fare
  @entry_station == nil || @exit_station == nil ? PENALTY_FARE : MINIMUM_FARE
end

end
