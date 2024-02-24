class Transaction
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "Pending"
  end

  def process_transaction(sender_balance)
    if @status == "Pending"
      if sender_balance >= @amount
        @status = "Processed"
        return true
      else
        puts "Insufficient balance for transaction: #{@sender} -> #{@receiver}"
        return false
      end
    else
      puts "Transaction already processed"
      return false
    end
  end

  def to_s
    "Transaction: #{@sender} -> #{@receiver}, Amount: #{@amount}, Status: #{@status}"
  end
end

def process_transactions(transactions, sender_balances)
  transactions.each_with_index do |transaction, index|
    sender_balance = sender_balances[index]
    transaction.process_transaction(sender_balance)
  end
end

def print_transactions(transactions)
  transactions.each do |transaction|
    puts transaction.to_s
  end
end

if __FILE__ == $0
  transactions = [
    Transaction.new("Alice", "Bob", 100),
    Transaction.new("Bob", "Charlie", 50),
    Transaction.new("Alice", "Eve", 200)
  ]

  sender_balances = [150, 70, 180]

  puts "Transactions before processing:"
  print_transactions(transactions)

  process_transactions(transactions, sender_balances)

  puts "\nTransactions after processing:"
  print_transactions(transactions)
end
