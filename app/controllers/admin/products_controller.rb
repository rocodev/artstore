class Admin::ProductsController < AdminController

	before_action :find_product, :only => [:show, :edit, :update, :destroy]


	def index
		@products = Product.order("created_at DESC").paginate(:page => params[:page], :per_page=>20)
	end

	def show
		@photos = @product.photos
	end

	def new
		@product = Product.new
		@product.photos.build
		#@photo = @Product.photos.new
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			redirect_to admin_products_path
		else
			render :new
		end	
	end

	def edit
	end

	def update
		if @product.update(product_params)
			redirect_to admin_products_path
		else
			render :edit
		end

	end

	def destroy
		if @product.destroy
			redirect_to admin_products_path
		end
	end



	private

	def find_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:title, :description, :quantity, :price, :photos_attributes => [:id, :image, :_destroy])
	end


end
