require_relative './journey'

class Oystercard

  LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @station = nil
    @history = []
    @journey = Journey.new
  end

  def top_up(money)
    fail "Above limit value of #{LIMIT}" unless balance + money <= LIMIT
    @balance += money
  end

  def in_journey?
    @station
  end

  def touch_in(station)
    fail "Insufficient funds" unless @balance >= MINIMUM
    @station = station
    @balance -= @journey.start_of_journey(station)
    
  end

  def touch_out(station)
    if @journey.end_of_journey(station) == 1
    @balance -= 1
    history << {entry_station: @station, exit_station: station}
    else
    @balance -= 6
    end
    @station = nil
      
  end

  attr_reader :balance
  attr_reader :station
  attr_reader :history


  private

  def deduct(money)
    @balance -= money
  end

end
