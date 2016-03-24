class PizzaOrder < ActiveRecord::Base
        before_save do
        self.toppings.gsub!(/[\[\]\"]/, "") if attribute_present?('toppings')
    end
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :size, presence: true
    validates :quantity, presence: true
    validates :address, presence: true, :length => { :minimum => 3}
    validates :city, presence: true, :length => { :minimum => 3}
    
    validates :quantity, numericality: { only_integer: true, :allow_nil => false }
    
    canadian_postal_code = /^([a-zA-Z]\d[a-zA-z]( )?\d[a-zA-Z]\d)$/
    validates :postal_code, format: { with: canadian_postal_code, :multiline => true}

    canadian_phone = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
    validates :phone_number, format: { with: canadian_phone, :multiline => true}
    
    validates :province, :presence => true
    
     
    def Price 
      @pizzaPrice = 0
      if self.size == "Small" 
         @pizzaPrice = 5.00
         
      elsif self.size == "Medium" 
         @pizzaPrice = 10.00
         
      elsif self.size == "Large" 
         @pizzaPrice = 15.00
         
      elsif self.size == "Extra Large" 
         @pizzaPrice = 20.00
      end 
      
      if (attribute_present?('toppings') && self.Crust == "Stuffed")
         @pizzaPrice += 2
      end
      
      if attribute_present?('toppings')
          if(self.toppings.count(',') > 0)
             @pizzaPrice += (self.toppings.count(',') * 0.5)
          end
      end
      
      if(attribute_present?('quantity') && (self.quantity.is_a? Numeric))
          @pizzaPrice *= self.quantity
      end
      
      $price = @pizzaPrice
      
      if(attribute_present?('province'))
          if self.province == "Manitoba"
              @pizzaPrice += (@pizzaPrice * 0.10) 
                $tax = 0.10
          end
          
          if self.province == "Ontario"
              @pizzaPrice += (@pizzaPrice * 0.13) 
              $tax = 0.13
          end
          
          if self.province == "Quebec"
              @pizzaPrice += (@pizzaPrice * 0.11) 
              $tax = 0.11
          end
          
          if self.province == "Saskatchewan"
              @pizzaPrice += (@pizzaPrice * 0.15) 
              $tax = 0.15
          end
      end
      
      $total_amount = $price * $tax
      
      return @pizzaPrice
    end 
end
