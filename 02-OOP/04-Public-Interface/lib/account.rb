require_relative "transaction"
class DepositError < StandardError
end

class BankAccount
  MIN_DEPOSIT =  100

  def initialize(name, iban, initial_deposit, password)
    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban

    add_transaction(initial_deposit)
  end

  attr_reader :name, :position, :iban

  def withdraw(amount)
    @position -= amount
    "You withdraw #{amount}, you have #{@position}€ on your account"
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
  end

  def deposit(amount)
    @position += amount
    "You deposit #{amount}, you have #{@position}€ on your account"
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
  end

  def transactions_history(args = {})
    if args[:password] == @password
      @transactions.to_s
    elsif args[:password] == nil
      "no password given"
    elsif args[:password] != @password
      "wrong password"
    end
  # TODO: Check if there is a password and if so if it is correct
  # TODO: return a string displaying the transactions, BUT NOT return the transaction array !
  end

  def iban
  @iban[0,4] + "*******************" + @iban[30,32]
  end

  def to_s
    "Owner: #{@name}\nIBAN: #{iban}\nCurrent Amount: #{@position}"
  end

  private

  def add_transaction(amount)
    @transactions << Transaction.new(amount)
    @position += amount
  end

end
