require_relative './journey'
require_relative './journey_log'

class Oystercard
  attr_reader :balance, :journey_log

  LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new
  end

  def top_up(money)
    fail "Above limit value of #{LIMIT}" unless balance + money <= LIMIT
    @balance += money
  end

  def touch_in(station,zone)
    fail "Insufficient funds" unless @balance >= MINIMUM
    @journey_log.start(station,zone)
  end

  def touch_out(station,zone)
    @journey_log.finish(station,zone)
    deduct
  end

  private

  def deduct
    @balance -= @journey_log.current_journey.fare
    @journey_log.current_journey = nil
  end

end
