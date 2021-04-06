require "account"

describe Account do 
  subject(:account) { described_class.new}

  context "When creating new account" do 
    describe "#initialize" do
      it "should have balance of 0" do 
        expect(account.balance).to eq 0
      end 
    end
  end

  describe "#deposit" do
    it "should be able to deposit money" do
      account.deposit(1000.00)
      expect(account.balance).to eq 1000.00
    end
  end

  describe "#withdrawal" do 
    it "should be able to withdraw money" do 
      account.withdrawal(50.50)
      account.deposit(1000.00)
      expect(account.balance).to eq 949.50
    end
  end 

end 