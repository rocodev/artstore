class Admin::ProductsController < ApplicationController

before_action :authenticate_user!
before_action :admin_required

# CREATE
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

# READ
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

# UPDATE
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path(@product)
    else
      render :edit
    end
  end

# DESTROY
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "刪除成功"
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :photo)
  end
end