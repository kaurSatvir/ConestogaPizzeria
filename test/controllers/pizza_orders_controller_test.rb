require 'test_helper'

class PizzaOrdersControllerTest < ActionController::TestCase
  setup do
    @pizza_order = pizza_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pizza_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pizza_order" do
    assert_difference('PizzaOrder.count') do
      post :create, pizza_order: { address: @pizza_order.address, cheese: @pizza_order.cheese, city: @pizza_order.city, crust: @pizza_order.crust, email: @pizza_order.email, first_name: @pizza_order.first_name, last_name: @pizza_order.last_name, phone_number: @pizza_order.phone_number, postal_code: @pizza_order.postal_code, price: @pizza_order.price, province: @pizza_order.province, quantity: @pizza_order.quantity, sauce: @pizza_order.sauce, size: @pizza_order.size, tax: @pizza_order.tax, toppings: @pizza_order.toppings, total_tax: @pizza_order.total_tax }
    end

    assert_redirected_to pizza_order_path(assigns(:pizza_order))
  end

  test "should show pizza_order" do
    get :show, id: @pizza_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pizza_order
    assert_response :success
  end

  test "should update pizza_order" do
    patch :update, id: @pizza_order, pizza_order: { address: @pizza_order.address, cheese: @pizza_order.cheese, city: @pizza_order.city, crust: @pizza_order.crust, email: @pizza_order.email, first_name: @pizza_order.first_name, last_name: @pizza_order.last_name, phone_number: @pizza_order.phone_number, postal_code: @pizza_order.postal_code, price: @pizza_order.price, province: @pizza_order.province, quantity: @pizza_order.quantity, sauce: @pizza_order.sauce, size: @pizza_order.size, tax: @pizza_order.tax, toppings: @pizza_order.toppings, total_tax: @pizza_order.total_tax }
    assert_redirected_to pizza_order_path(assigns(:pizza_order))
  end

  test "should destroy pizza_order" do
    assert_difference('PizzaOrder.count', -1) do
      delete :destroy, id: @pizza_order
    end

    assert_redirected_to pizza_orders_path
  end
end
