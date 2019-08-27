require 'oystercard'

describe Oystercard do
  it 'expects the oystercard to initialize with a balance of 0' do
    expect(subject.balance).to eq 0
  end

    describe '#top_up' do
    it 'tops up the balance with 5 ' do
      expect{ subject.top_up 5 }. to change{ subject.balance }.by 5
    end
    end
  end
