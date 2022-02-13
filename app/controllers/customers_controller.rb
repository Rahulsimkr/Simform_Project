class CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end

  def show
    @customer =  Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer= Customer.find(customer_params)

    rsepond_to do |format|
      if @customer.save
        format.html { redirect_to customert_url(@customer), notice: "Customer  successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @customer =  Customer.find(params[:id])
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: "Customer successfully updated" }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end
   
  def destroy
    @customer =  Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_t0 customer_url, notice: "Customer destroyed Succesfully"}
      format.json { header :no_content }
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:fname, :lname, :email, :phone_number)
    end
end
