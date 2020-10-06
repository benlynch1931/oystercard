require 'oystercard'

describe Oystercard do
  let(:station) { double :station }

  it 'initalizes with a default balance of 0' do
    expect(subject.balance).to eq 0
  end


  describe '#top_up' do


    it 'adds given amount to balance' do
      expect { subject.top_up(10)}.to change{ subject.balance }.by 10
    end

    it 'adds nothing if no value is provided' do
      expect { subject.top_up}.to change{ subject.balance }.by 0
    end

    it 'it raises error if balance exceeds 90' do
      expect{subject.top_up(95)}.to raise_error "Error: Top-up will exceed card limit of £#{Oystercard::CARD_LIMIT}"
    end
  end

  describe '#deduct' do

    it 'deducts a fare from a balance' do
      subject.top_up(10)
      subject.touch_in(:station)
      expect { subject.touch_out }.to change {subject.balance}.by (-(Oystercard::MINIMUM_FARE))
    end
  end

  describe '#touch_in' do


    it 'changes card_use_status to "true" when called' do
      subject.top_up(10)
      subject.touch_in(:station)
      expect(subject).to be_in_journey
    end

    it 'raises error if insufficient funds on the card' do
      error_message = "Error: Unsufficient funds available. Minimum £#{Oystercard::MINIMUM_FARE} needed..."
      expect { subject.touch_in(:station)}.to raise_error(error_message)
    end
  end

  describe '#touch_out' do


    it 'changes card_use_status back to "false" when called' do
      subject.top_up(10)
      subject.touch_in(:station)
      subject.touch_out
      expect(subject).to_not be_in_journey
    end

    it 'changes the current station to nil' do
      subject.top_up(10)
      subject.touch_in(:station)
      subject.touch_out
      expect(subject.current_station).to eq(nil)
    end
  end

  describe '#in_journey?' do

    it { is_expected.to respond_to(:in_journey?) }

    it 'displays card_use_status as "false" on initialization' do
      expect(subject).to_not be_in_journey
    end

    it 'displays card_use_status as "true" after touch_in' do
      subject.top_up(10)
      subject.touch_in(:station)
      expect(subject).to be_in_journey
    end

    it 'displays card_use_status as "false" after touch_out' do
      subject.touch_out
      expect(subject).to_not be_in_journey
    end
  end

  describe '#entry_station' do
        it 'records an entry station to variable' do
          subject.top_up(10)
          subject.touch_in(:station)
        expect(subject.update_station(:station)).to eq(:station)
        end
      end
end

# In order to use public transport
# As a customer
# I want money on my card
