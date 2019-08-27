require 'oystercard'

describe Oystercard do
  it 'expects the oystercard to initialize with a balance of 0' do
    expect(subject::balance).to eq 0
  end
end