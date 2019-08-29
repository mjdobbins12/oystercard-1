require 'oystercard'

describe Oystercard do
  let(:shoreditch) { double :station }
  let(:clapham) { double :station}

  describe "#initialize" do

    it 'expects the oystercard to initialize with a balance of 0' do
      expect(subject.balance).to eq 0
    end

  end

  describe '#top_up' do
    it 'tops up the balance with 5' do
      expect{ subject.top_up 5 }.to change{ subject.balance }.by 5
    end

    it "expects to throw an exception if topup amount + balance exceeds limit" do
      expect { subject.top_up(Oystercard::LIMIT + 1) }.to raise_error "Above limit value of #{Oystercard::LIMIT}"
    end
  end

  describe '#touch_in' do
    context "card has been topped up" do
      before(:each) do
        subject.top_up(17)
      end

    end

    it "requires a minimum balance" do
      expect{ subject.touch_in(shoreditch) }.to raise_error("Insufficient funds")
    end
  end

  describe '#touch_out' do
    context "card has been topped up" do
      before(:each) do
        subject.top_up(17)
        subject.touch_in(shoreditch)
      end

      it 'expects the balance to reduce by the calculated fare on touch out' do
        expect{ subject.touch_out(clapham) }.to change{ subject.balance }.by(-Oystercard::MINIMUM)
      end

    end
  end

end
