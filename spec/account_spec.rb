require "account"

describe Account do 
  subject(:account) { described_class.new}

  context "When creating new account" do 
    describe "#initialize" do
      it "should have balance of 0" do 
        expect(account.balance).to eq 0
      end 
    end
    it "should have an empty transaction log" do 
      expect(account.transaction_log).to match_array([])
    end 
  end

  describe "#deposit" do
    it "should be able to deposit money" do
      account.deposit(1000.00)
      expect(account.balance).to eq 1000.00
    end
  end

  describe "#withdraw" do 
    it "should be able to withdraw money" do 
      account.deposit(1000.00)
      account.withdraw(50.50)
      
      expect(account.balance).to eq 949.50
    end

    it "raises an error when insufficient funds" do 
      account.deposit(50.00)  

      expect{account.withdraw(100.00)}.to raise_error("Insufficient balance")
    end     
  end 

end 