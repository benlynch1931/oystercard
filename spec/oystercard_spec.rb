require 'oystercard'

describe Oystercard do
  it 'initalizes with a default balance of 0' do
    expect(subject.balance).to eq 0
  end

end

# In order to use public transport
# As a customer
# I want money on my card
