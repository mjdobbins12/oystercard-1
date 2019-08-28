class Oystercard

  LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @station = nil
    @history = []
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
  end

  def touch_out(station)
    deduct(MINIMUM)
    history << {entry_station: @station, exit_station: station}
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
