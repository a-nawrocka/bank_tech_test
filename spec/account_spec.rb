require "account"

describe Account do 

  context "When creating new account" do 
    describe "#initialize" do
      it "should have balance of 0" do 
        expect(subject.balance).to eq 0
      end 
    end
    it "should have an empty transaction log" do 
      expect(subject.display_transaction_log).to eq("Date      || Credit  || Debit  || Balance \n")
    end 
  end

  describe "#deposit" do
    it "should be able to deposit money" do
      subject.deposit(1000.00)
      expect(subject.balance).to eq 1000.00
    end
  end

  describe "#withdraw" do 
    it "should be able to withdraw money" do 
      subject.deposit(1000.00)
      subject.withdraw(50.50)
      
      expect(subject.balance).to eq 949.50
    end

    it "raises an error when insufficient funds" do 
      subject.deposit(50.00)  

      expect{subject.withdraw(100.00)}.to raise_error("Insufficient balance")
    end     
  end 

  describe "#display_transaction_log"
    it "prints all transactions" do 
      subject.deposit(10.00)      
      expect(subject.display_transaction_log).to eq("Date      || Credit  || Debit  || Balance \n#{Time.now.strftime("%d-%m-%Y")} || 10.00 ||  || 10.00 \n")
    end 

end 
