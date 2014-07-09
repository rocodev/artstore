class ProductsController < ApplicationController
  before_action :frontEndHeaders
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
  end
end