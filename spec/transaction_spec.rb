require "transaction"

describe Transaction do
  describe "#initialize" do
    before(:each) do
      allow(Time).to receive(:now).and_return(@time_now)
    end

    it "represents transaction when client deposits money" do
      transaction = Transaction.new(10.00, nil, 110.00)
      expect(transaction.credit).to eq 10.00
      expect(transaction.debit).to eq nil
      expect(transaction.balance).to eq 110.00
      expect(transaction.date).to eq @time_now
    end

    it "represents transaction when client withdraw money" do
      transaction = Transaction.new(nil, 10.00, 90.00)
      expect(transaction.credit).to eq nil
      expect(transaction.debit).to eq 10.00
      expect(transaction.balance).to eq 90.00
      expect(transaction.date).to eq @time_now
    end
  end
end
