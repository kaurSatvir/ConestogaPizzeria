class PizzaOrdersController < ApplicationController
  before_action :set_pizza_order, only: [:show, :edit, :update, :destroy]

  # GET /pizza_orders
  # GET /pizza_orders.json
  def index
    @pizza_orders = PizzaOrder.all
  end

  # GET /pizza_orders/1
  # GET /pizza_orders/1.json
  def show
  end

  # GET /pizza_orders/new
  def new
    @pizza_order = PizzaOrder.new
  end

  # GET /pizza_orders/1/edit
  def edit
  end

  # POST /pizza_orders
  # POST /pizza_orders.json
  def create
    @pizza_order = PizzaOrder.new(pizza_order_params)

    respond_to do |format|
      if @pizza_order.save
        format.html { redirect_to @pizza_order, notice: 'Pizza order was successfully created.' }
        format.json { render :show, status: :created, location: @pizza_order }
      else
        format.html { render :new }
        format.json { render json: @pizza_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pizza_orders/1
  # PATCH/PUT /pizza_orders/1.json
  def update
    respond_to do |format|
      if @pizza_order.update(pizza_order_params)
        format.html { redirect_to @pizza_order, notice: 'Pizza order was successfully updated.' }
        format.json { render :show, status: :ok, location: @pizza_order }
      else
        format.html { render :edit }
        format.json { render json: @pizza_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pizza_orders/1
  # DELETE /pizza_orders/1.json
  def destroy
    @pizza_order.destroy
    respond_to do |format|
      format.html { redirect_to pizza_orders_url, notice: 'Pizza order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza_order
      @pizza_order = PizzaOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pizza_order_params
      params.require(:pizza_order).permit(:first_name, :last_name, :email, :phone_number, :address, :city, :province, :postal_code, :size, :crust, :sauce, :cheese, {:toppings => []}, :quantity, :price, :tax, :total_tax)
    end
end
