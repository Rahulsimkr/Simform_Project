class OrdersController < ApplicationController
 
  before_action :create_order, only: [:show, :edit, :update, :destroy]
  def index
    @orders = Order.all
    if params[:search]
      if params[:search] == "booked"
        @orders = Order.where(status: "booked")
      elsif params[:search] == "cancelled"
        @orders = Order.where(status: "cancelled")
      else
        @orders = Order.all
      end
    end
  end

  def show
    @order = Order.find_by_id(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(input_params)
    if @order.save
      flash[:notice] = "Order is successfully created"
      redirect_to order_path @order
    else
      render :new, status: :unprocessable_entity
    end
  end

#   def create
#     @order = Order.new(input_params)

#     respond_to do |format|
#       if @board.save
#         format.html { redirect_to @order, notice: 'Order was successfully created.' }
#         format.json { render :show, status: :created, location: @order }
#       else
#         format.html { render :new }
#         format.json { render json: @board.errors, status: :unprocessable_entity }
#       end
#     end
# end

  def edit
  end

  def update
    if @order.update(input_params)
      flash[:notice] = "Order is successfully edited"
      redirect_to orders_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  def search_order_by_product_name
    if params[:search]
      @order_id = Order.where("product_id=?", (Product.where("title=?", params[:search]).pluck(:id)))
    end
  end

  private

  def input_params
    params.require(:order).permit(:quantity, :total_price, :status, :product_id, :customer_id)
  end

  def create_order
    @order = Order.find_by_id(params[:id])
  end
end