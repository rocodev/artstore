class Admin::PhotosController < AdminController

	def new
		#@photo = Photo.new
		@product = Product.find(params[:product_id])
		@photo = @product.photos.build
	end

	def create
		#@photo = Photo.new(photo_params)
		@product = Product.find(params[:product_id])
		@photo = @product.photos.build(photo_params)
		if @photo.save
			redirect_to admin_product_path(@product)
		end
	end

	def index
		@photos = Photo.all
	end



	private 

	def photo_params
		params.require(:photo).permit(:image)
	end


end
