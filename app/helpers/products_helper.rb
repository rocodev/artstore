module ProductsHelper

  def render_product_photo(photo)
    if photo.present?
      image_tag(photo.image.thumb.url, :class => "thumbnail")
    else
      "no pic"
    end
  end

end
