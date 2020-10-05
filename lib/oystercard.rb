class Oystercard
  CARD_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount = 0)
    # (amount = 0) means instead of raising an error, ruby with assume that the
    # argument 'amount' is equal to 0
    fail 'error add this excedes card limit of 90$' if amount + @balance >= CARD_LIMIT
    @balance += amount
  end

end
