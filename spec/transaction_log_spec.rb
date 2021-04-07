require "transaction_log"

describe TransactionLog do
  # subject(:transaction_log) { described_class.new}

  context "When creating new transaction_log" do
    describe "#initialize" do
      it "should have an empty log" do
        expect(subject.display).to eq("Date      || Credit  || Debit  || Balance \n")
      end
    end
  end

  describe "#add" do
    it "should be able add transaction" do
      expect { subject.add(100.00, nil, 100.00) }.to change { subject.log.count }.by(1)
    end
  end

  describe "#display" do
    it "prints transactions" do
      subject.add(10.00, nil, 10.00)
      expect(subject.display).to eq("Date      || Credit  || Debit  || Balance \n#{Time.now.strftime('%d-%m-%Y')} || 10.00 ||  || 10.00 \n")
    end
  end
end
