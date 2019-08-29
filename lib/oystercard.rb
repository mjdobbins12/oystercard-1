require_relative './journey'

class Oystercard

  LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @history = []
  end

  def top_up(money)
    fail "Above limit value of #{LIMIT}" unless balance + money <= LIMIT
    @balance += money
  end

  def touch_in(station)
    fail "Insufficient funds" unless @balance >= MINIMUM
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey.end_journey(station)
    @history << {entry_station: @journey.entry_station, exit_station: station}
    deduct
  end

  attr_reader :balance
  attr_reader :history


  private

  def deduct
    @balance -= @journey.fare
  end

end
