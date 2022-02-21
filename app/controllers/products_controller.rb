class ProductsController < ApplicationController
  before_action :create_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def default_scoped
    @products = Product.unscoped
  end

  def show

  end

  def new
    @product = Product.new
  end

  def create
    # binding.pry
    @product = Product.create(input_params)
    if @product.save
      flash[:notice] = "Product is successfully created"
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(input_params)
      flash[:notice] = "Product is successfully edited"
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @controller = Controller.find(params[:id])
    @controller.destroy
    params[:id] = nil
    flash[:notice] = "Products has been deleted"
    redirect_to :action => :index
  end

  private

  def input_params
    params.require(:product).permit(:title, :description, :price, :capacity, :is_active, :status)
  end

  def create_product
    @product = Product.find_by_id(params[:id])
  end
end
