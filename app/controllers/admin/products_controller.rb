class Admin::ProductsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :admin_required
  

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy!
      redirect_to admin_products_path
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title,:description,:quantity, :price, :image)
  end


end
