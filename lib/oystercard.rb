class Oystercard

  LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(money)
    fail "Above limit value of #{LIMIT}" unless balance + money <= LIMIT
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def in_journey?
    @journey
  end

  def touch_in
    fail "Insufficient funds" unless @balance >= MINIMUM
    @journey = true
  end

  def touch_out
    @journey = false
  end

  attr_reader :balance
end
