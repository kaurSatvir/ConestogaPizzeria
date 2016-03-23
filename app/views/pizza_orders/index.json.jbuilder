json.array!(@pizza_orders) do |pizza_order|
  json.extract! pizza_order, :id, :first_name, :last_name, :email, :phone_number, :address, :city, :province, :postal_code, :size, :crust, :sauce, :cheese, :toppings, :quantity, :price, :tax, :total_tax
  json.url pizza_order_url(pizza_order, format: :json)
end
