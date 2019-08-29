class JourneyLog

  attr_reader :log
  attr_accessor :current_journey

  def initialize
    @log = []
  end

  def start(entry_station)
    @current_journey = Journey.new
    @current_journey.entry_station = entry_station
  end

  def finish(exit_station)
    current_journey
    @current_journey.exit_station = exit_station
    @log << {entry_station: @current_journey.entry_station, exit_station: @current_journey.exit_station}
  end

  def journeys
    @log.each { |hash| puts "#{hash[:entry_station]} to #{hash[:exit_station]}"}
  end

  def current_journey
    @current_journey ||= Journey.new
  end

end