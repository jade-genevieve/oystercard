require "oyster"

describe Oystercard do
  it "creates an instance of oystercard" do
    expect(subject).to be_an_instance_of Oystercard
    # it {is_expected.to be_an_instance of Oystercard}
  end
  describe "#initialize" do
    it "initializes an Oystercard with a balance of 0" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "increase balance by the amount of top-up" do
      subject.top_up(20)
      expect(subject.balance).to eq 20
    end

    it "raises error and prevents balance exceeding £90" do
      expect { subject.top_up(91) }.to raise_error "Maximum limit £#{Oystercard::MAXIMUM_BALANCE} exceeded"
    end
  end
end
