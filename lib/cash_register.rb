
class CashRegister 

    attr_accessor :total, :discount, :items, :transactions
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = Array.new
        @transactions = Array.new
    end

    def add_item(title, price, quantity=1)
        self.total = total+price*quantity 
        self.transactions.push(price*quantity)
        @items.fill(title, items.size, quantity)
    end

    def apply_discount
        if self.discount>0 
            percent_diff=(100-self.discount)/100.0
            @total=(total*percent_diff).to_i        
             "After the discount, the total comes to $#{self.total}."
        elsif self.discount=0
            "There is no discount to apply."
        end
    end

    # def items 
    #    @items 
    # end

    # def transactions 
    #     @transactions
    # end

    def void_last_transaction
        self.total=total-transactions[-1]
        transactions.pop
    end

end
