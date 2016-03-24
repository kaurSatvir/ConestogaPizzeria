class PizzaOrder < ActiveRecord::Base
        before_save do
        self.toppings.gsub!(/[\[\]\"]/, "") if attribute_present?('toppings')
    end
    
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
      @SizePrice = 0
      if self.size == "Small" 
         @SizePrice = 5.00
         
      elsif self.size == "Medium" 
         @SizePrice = 10.00
         
      elsif self.size == "Large" 
         @SizePrice = 15.00
         
      elsif self.size == "Extra Large" 
         @SizePrice = 20.00
      end 
      
      if (attribute_present?('toppings') && self.Crust == "Stuffed")
         @SizePrice += 2
      end
      
      if attribute_present?('toppings')
          if(self.toppings.count(',') > 0)
             @SizePrice += (self.toppings.count(',') * 0.5)
          end
      end
      
      if(attribute_present?('quantity') && (self.quantity.is_a? Numeric))
          @SizePrice *= self.quantity
      end
      
      $prePrice = @SizePrice
      
      if(attribute_present?('province'))
          if self.province == "Manitoba"
              @SizePrice += (@SizePrice * 0.10) 
                $Tax = 0.10
          end
          
          if self.province == "Ontario"
              @SizePrice += (@SizePrice * 0.13) 
              $Tax = 0.13
          end
          
          if self.province == "Quebec"
              @SizePrice += (@SizePrice * 0.11) 
              $Tax = 0.11
          end
          
          if self.province == "Saskatchewan"
              @SizePrice += (@SizePrice * 0.15) 
              $Tax = 0.15
          end
      end
      
      $Tax = $prePrice * $Tax
      
      return @SizePrice
    end 
end
