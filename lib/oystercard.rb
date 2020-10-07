class Oystercard
  CARD_LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :current_journey, :journey_history

  def initialize
    @balance = 0
    @current_journey = {}
    @journey_history = []
  end

  def top_up(amount = 0)
    fail "Error: Top-up will exceed card limit of £#{CARD_LIMIT}" if amount + @balance >= CARD_LIMIT
    @balance += amount
  end

  private

  def deduct(amount = 0)
    @balance -= amount
  end

  def add_history
    @journey_history.push(@current_journey)
  end

  public

  def touch_in(station)
    fail "Error: Unsufficient funds available. Minimum £1 needed..." if @balance < MINIMUM_FARE
    @current_journey[:entry_station] = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @current_journey[:exit_station] = station
    add_history
  end

  def in_journey?
    !!@current_station
  end


end
