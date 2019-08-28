class Oystercard

  LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @station = nil
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

  def touch_out
    deduct(MINIMUM)
    @station = nil
  end

  attr_reader :balance
  attr_reader :station

  private

  def deduct(money)
    @balance -= money
  end

end
