class JourneyLog

  attr_reader :log
  attr_accessor :current_journey

  def initialize
    @log = []
  end

  def start(entry_station, zone)
    @current_journey = Journey.new
    @current_journey.entry_station.name = entry_station
    @current_journey.entry_station.zone = zone
  end

  def finish(exit_station, zone)
    current_journey
    @current_journey.exit_station.name = exit_station
    @current_journey.exit_station.zone = zone
    @log << {entry_station: @current_journey.entry_station.name, exit_station: @current_journey.exit_station.name}
  end

  def journeys
    @log.each { |hash| puts "#{hash[:entry_station]} to #{hash[:exit_station]}"}
  end

  def current_journey
    @current_journey ||= Journey.new
  end

end