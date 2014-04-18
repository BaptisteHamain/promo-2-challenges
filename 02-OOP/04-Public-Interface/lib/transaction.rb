# Optional
class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @date = Time.now
    @comment = "standard transaction"
  end

  def to_s
    # Nicely print transaction infos using Time#strftime. = pour afficher joliment
    "Transaction of #{@amount} done on #{@date}"
  end
end
