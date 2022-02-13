class OrderController < ApplicationController

  def edit
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def index
    @order = Order.all 
    if params[:search]
      if params[:search]=="booked"
        @orders=Order.where(status:'booked')
      elsif params[:search]=="cancelled"
        @orders=order.where(status:'cancelled')
      else
        @orders = Order.all
      end
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
      
    respond_to do |format|
      if @order.save 
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @Order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.error, status: :unprocessable_entity}
      end
    end
  end  

  def update
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order  was successfully updated"}
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity}
      end
    end
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed"}
      format.json { head :no_content}
    end
  end

  def search_order_by_product_name 
    if params[:search]
      @order_id=Order.where("product_id=?",(Product.where("name=?",params[:search]).pluck(:id)))
    end
  end

  private
    def order_params
      params.require(:order).permit(:quantity, :customer_id, :total_price, :product_id,:status)

    end
end