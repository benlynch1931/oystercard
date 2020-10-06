class Oystercard
  CARD_LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :current_station

  def initialize
    @balance = 0
  end

  def top_up(amount = 0)
    fail "Error: Top-up will exceed card limit of £#{CARD_LIMIT}" if amount + @balance >= CARD_LIMIT
    @balance += amount
  end

  private

  def deduct(amount = 0)
    @balance -= amount
  end

  public

  def touch_in(station)
    fail "Error: Unsufficient funds available. Minimum £1 needed..." if @balance < MINIMUM_FARE
    update_station(station)
  end

  def touch_out
    deduct(MINIMUM_FARE)
    update_station(nil)
  end

  def in_journey?
    !!@current_station
  end

  def update_station(station)
    @current_station = station
  end

end
