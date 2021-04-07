require_relative "transaction_log"

class Account
  attr_reader :balance, :transaction_log

  def initialize
    @balance = 0
    @transaction_log = TransactionLog.new
  end

  def deposit(amount)
    @balance += amount
    @transaction_log.add(amount, nil, @balance)
  end

  def withdraw(amount)
    raise("Insufficient balance") if @balance < amount

    @balance -= amount
    @transaction_log.add(nil, amount, @balance)
  end

  def display_transaction_log
    @transaction_log.display
  end
end
