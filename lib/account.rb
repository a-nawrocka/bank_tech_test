require_relative "transaction"

class Account 
  attr_reader :balance, :transaction_log

  def initialize
    @balance = 0
    @transaction_log = []
  end 

  def deposit(amount)
    @balance += amount
    transaction = Transaction.new(amount, nil, @balance)
    @transaction_log << transaction
  end

  def withdraw(amount)
    fail("Insufficient balance") if @balance < amount
    @balance -= amount
    transaction = Transaction.new(nil, amount, @balance)
    @transaction_log << transaction
  end 

end 
