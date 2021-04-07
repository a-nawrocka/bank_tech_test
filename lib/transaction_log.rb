require_relative "transaction"

class TransactionLog 
attr_reader :log

  def initialize
    @log = []
  end 

  def add(credit, debit, balance)
    transaction = Transaction.new(credit, debit, balance)
    @log << transaction
  end

  def display
    history = "Date      || Credit  || Debit  || Balance \n"
    @log.reverse.each do |transaction|
      history += "#{transaction.date.strftime("%d-%m-%Y")} || "
      history += "#{transaction.credit ? "%.2f" % transaction.credit : "" } || "
      history += "#{transaction.debit ? "%.2f" % transaction.debit : ""} || "
      history += "#{"%.2f" % transaction.balance} \n"
    end

    history
  end

end 