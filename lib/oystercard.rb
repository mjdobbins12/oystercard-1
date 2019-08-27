class Oystercard
  def initialize
    @balance = 0
  end

  def top_up(money)
    @balance += money
  end

  attr_reader :balance
end
