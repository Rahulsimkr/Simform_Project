class MyProductsController < ApplicationController

  def new
    @product = My_product.new
  end

  def create
    @myproduct = Myproduct.create(input_params)
    if @myproduct.save 
      flash[:notice] = "Product created succesfully"
      redirect_to myproduct_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
  end

  def input_params 
    params.require(:myproduct).permit(:title, :description, :price)
  end 
end
