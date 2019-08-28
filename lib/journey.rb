class Journey

  def initialize
    @entry_station = nil
  end

  def start_of_journey(station)
    if @entry_station # Failing to touch out
      return 6
    else
      @entry_station = station
      return 0
    end
  end

  def end_of_journey(station)
    if !@entry_station # Failing to touch in
      return 6
    else
        @entry_station = nil
      return 1
    end
  end

end