require 'oystercard'

describe Oystercard do
  let(:shoreditch) { double :station }
  it 'expects the oystercard to initialize with a balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it 'tops up the balance with 5 ' do
      expect{ subject.top_up 5 }.to change{ subject.balance }.by 5
    end

    it "expects to throw an exception if topup amount + balance exceeds limit" do
      expect { subject.top_up(Oystercard::LIMIT + 1) }.to raise_error "Above limit value of #{Oystercard::LIMIT}"
    end
  end

  describe '#in_journey?' do
    it "expects not to be in journey" do
      expect(subject).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    context "card has been topped up" do
      before(:each) do
        subject.top_up(17)
      end

      it "expects boolean variable journey to change from false to true" do
        subject.touch_in(shoreditch)
        expect(subject).to be_in_journey
      end

      it "remembers the entry station" do
        expect{ subject.touch_in(shoreditch) }.to change{ subject.station }.from(nil).to(shoreditch)
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

      it "expects boolean variable journey to change from true to false" do
        subject.touch_out
        expect(subject).not_to be_in_journey
      end

      it 'expects the balance to reduce by the minimum fare every time the user touches out' do
        expect{ subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM)
      end

      it "forgets the entry station upon touching out" do
        expect{ subject.touch_out }.to change{ subject.station }.from(shoreditch).to(nil)
      end
    end
  end

end
