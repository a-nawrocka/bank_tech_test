class Account 
  attr_reader :balance, :transaction_log

  def initialize
    @balance = 0
    @transaction_log = []
  end 

  def deposit(amount)
    @balance += amount

  end

  def withdraw(amount)
    fail("Insufficient balance") if @balance < amount
    @balance -= amount

  end 

end 
