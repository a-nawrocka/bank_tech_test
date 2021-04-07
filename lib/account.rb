require_relative "transaction"

class Account 
  attr_reader :balance, :transaction_log

  def initialize
    @balance = 0
    @transaction_log = []
  end 

  def deposit(amount)
    @balance += amount
    add_transaction(amount, nil, @balance)
  end

  def withdraw(amount)
    fail("Insufficient balance") if @balance < amount
    @balance -= amount
    add_transaction(nil, amount, @balance)    
  end 

  def display_transaction_log
    log = "Date      || Credit  || Debit  || Balance \n"
    @transaction_log.reverse.each do |transaction|
      log += "#{transaction.date.strftime("%d-%m-%Y")} || "
      log += "#{transaction.credit ? "%.2f" % transaction.credit : "" } || "
      log += "#{transaction.debit ? "%.2f" % transaction.debit : ""} || "
      log += "#{"%.2f" % transaction.balance} \n"
    end

    log
  end

  private

  def add_transaction(credit, debit, balance)
    transaction = Transaction.new(credit, debit, balance)
    @transaction_log << transaction
  end

end 

