require "journey.rb"

describe Journey do
    let(:entry_station) { double :entry_station}

    it "takes an entry station when starts a journey" do
        subject = Journey.new(:entry_station)
        expect(subject.entry_station).to eq :entry_station
    end

    it "calculates the fare of the journey" do
        subject = Journey.new(:entry_station)
        expect(subject.end(:exit_station)).to eq Oystercard::MINIMUM_FARE
    end
end
