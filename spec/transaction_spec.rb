require "transaction"

describe Transaction do

  describe "#initialize" do  
    before(:each) do 
      allow(Time).to receive(:now).and_return(@time_now)  
    end 

    it "make a deposit" do      
        transaction = Transaction.new(10.00, nil)
        expect(transaction.credit).to eq 10.00
        expect(transaction.debit).to eq nil        
        expect(transaction.date).to eq @time_now
      end
    end


end

