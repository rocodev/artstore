class Admin::ProductsController < ApplicationController
  before_action :authenticate_user! ,only: :new
  before_action :admin_required,only: :new
  before_action :backEndHeaders,only: :new
  before_action :frontEndHeaders,only: [:index,:show]

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  private
  def product_params
    params.require(:product).permit(:title, :description,:quantity,:price)
  end
end