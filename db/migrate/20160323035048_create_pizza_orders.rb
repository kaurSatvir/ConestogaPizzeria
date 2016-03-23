class CreatePizzaOrders < ActiveRecord::Migration
  def change
    create_table :pizza_orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :size
      t.string :crust
      t.string :sauce
      t.string :cheese
      t.string :toppings
      t.integer :quantity
      t.float :price
      t.float :tax
      t.float :total_tax

      t.timestamps null: false
    end
  end
end
