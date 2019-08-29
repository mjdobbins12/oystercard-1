require_relative './journey'
require_relative './journey_log'

class Oystercard

  LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @history = []
    @journey_log = JourneyLog.new
  end

  def top_up(money)
    fail "Above limit value of #{LIMIT}" unless balance + money <= LIMIT
    @balance += money
  end

  def touch_in(station)
    fail "Insufficient funds" unless @balance >= MINIMUM
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    # deduct
  end

  attr_reader :balance
  attr_reader :history
  attr_reader :journey_log


  private

  def deduct
    @balance -= @journey.fare
  end

end
