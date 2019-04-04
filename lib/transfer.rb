class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if self.valid? && sender.balance > self.amount && sender.status = "pending"
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    elsif sender.balance < self.amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
    def reverse_transfer
      if self.status = "complete"
        self.sender += self.amount
        self.receiver -= self.amount
        self.status = "received"
      end
    end
end
