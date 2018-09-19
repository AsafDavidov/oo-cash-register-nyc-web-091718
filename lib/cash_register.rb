class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity=1)
    (0...quantity).each do |each_item|
      items << title
    end

    self.total += price*quantity
    self.last_transaction = price

  end

  def apply_discount
    if @discount != 0
      percentage = 1.0-@discount/100.to_f
      self.total = self.total * percentage
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
    self.items.pop
  end

end #end of CashRegister
