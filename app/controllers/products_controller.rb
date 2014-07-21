class ProductsController < ApplicationController

  before_action :validate_search_key, :only => [:search]

  def index
    @products = Product.order("id DESC")
  end


  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart

    @product = Product.find(params[:id])

    if !current_cart.items.include?(@product)

      if @product.quantity > 0
        current_cart.add_product_to_cart(@product, 1 )
        flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
      else
        flash[:warning] = "商品缺貨中"
      end

    else
      flash[:warning] = "你的購物車內已有此物品"
    end

    redirect_to :back

  end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 20 )
    end
  end


  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :title_cont => query_string }
  end

end