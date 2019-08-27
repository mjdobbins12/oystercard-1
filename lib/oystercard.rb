class Oystercard

  LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Above limit value of #{LIMIT}" unless balance + money <= LIMIT
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  attr_reader :balance
end
