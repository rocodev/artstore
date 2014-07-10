class Admin::ProductsController < ApplicationController
 

  def index
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity)
  end
end
