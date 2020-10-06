class Oystercard
  CARD_LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance

  def initialize
    @balance = 0
    @card_use_status = false
  end

  def top_up(amount = 0)
    # (amount = 0) means instead of raising an error, ruby with assume that the
    # argument 'amount' is equal to 0
    fail "Error: Top-up will exceed card limit of £#{CARD_LIMIT}" if amount + @balance >= CARD_LIMIT
    @balance += amount
  end

  def deduct(amount = 0)
    @balance -= amount
  end

  def touch_in
    fail "Error: Unsufficient funds available. Minimum £1 needed..." if @balance < MINIMUM_FARE
    @card_use_status = true
  end

  def touch_out
    @card_use_status = false
  end

  def in_journey?
    @card_use_status
  end

end
