class JourneyLog

  attr_reader :log

  def initialize
    @log = []
  end

  def start(entry_station)
    @journey = Journey.new(entry_station)
  end

  def finish(exit_station)
    @journey.exit_station = exit_station
    current_journey
  end

  def journeys
    @log.dup
  end

  private

  def current_journey
    @log << {entry_station: @journey.entry_station, exit_station: @journey.exit_station}
  end

end