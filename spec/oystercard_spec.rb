require 'oystercard'

describe Oystercard do
  it 'initalizes with a default balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it 'responds to being called by a receiver' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

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



    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts given amount from balance' do

      subject.top_up(30)
      subject.deduct(20)
      expect(subject.balance).to eq 10
    end
  end

end

# In order to use public transport
# As a customer
# I want money on my card
