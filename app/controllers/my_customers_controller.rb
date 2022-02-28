class MyCustomersController < ApplicationController
  
  def create 
    @myproduct = Myproduct.create(input_params)
    if @myproduct.save 
      flash[:notice] = "Product created succesfully"
      redirect_to myproducts_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  def edit
  end

  def show 
  end

  def input_params 
    params.require(:mycustomer).permit(:title, :description, :price)
  end 
end
