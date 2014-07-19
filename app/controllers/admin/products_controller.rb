class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @product.photos.build
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
    @product = Product.find(params[:id])
    @product.update_attributes(update_product_params)
    logger.debug { update_product_params }
    if @product.save
      redirect_to admin_products_path
    else
      render :edit
    end
  end 

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  private
 
    def product_params
      params.require(:product).permit(:title, :description,:quantity,:price,:for_sale,photos_attributes:[:image])
    end  

    def update_product_params
      params.require(:product).permit(:title, :description,:quantity,:price,:for_sale,photos_attributes:[:image,:id])
    end  

    # def product_params
    #   params.require(:product).permit(:title, :description,:quantity,:price,:for_sale,photos_attributes:[:image])
    # end  
end
