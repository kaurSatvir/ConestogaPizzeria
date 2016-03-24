module PizzaOrdersHelper
    def checked(area)
        @pizza_order.toppings.nil? ? false : @pizza_order.toppings.match(area)
    end
end
