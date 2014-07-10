class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :backEndHeaders

  def new
    @product = Product.new
    @photo = @product.photos.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :description,:quantity,:price,:photos_attributes => [:image])
  end
end