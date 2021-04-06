 class Transaction
  attr_reader :credit, :debit, :date

  def initialize(credit, debit)
    @credit = credit
    @debit = debit
    @date = Time.now
  end

 end
