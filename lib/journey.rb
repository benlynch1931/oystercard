require "oystercard.rb"

class Journey
  attr_reader :entry_station

  def initialize(entry_station)
   @entry_station = entry_station
   @exit_station = nil
  end

  def end(exit_station)
    @exit_station = exit_station
    calc_fare
  end

  private

  def calc_fare
    @fare = Oystercard::MINIMUM_FARE
  end
end
