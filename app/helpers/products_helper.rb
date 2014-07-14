module ProductsHelper

  def render_product_photo(photo, size = "thumb")
    if photo.present?
      image_tag(photo.image.thumb.url, :class => "thumbnail")
    else
      image_tag("http://placehold.it/200x200&text=No Pic", :class => "thumbnail")
    end
  end

  def render_product_name(product)
    product.title
  end

  def render_product_desc(product)
    simple_format(product.description)
  end

  def render_product_quantity(product)
    product.quantity
  end

  def render_product_price(product)
    product.price
  end

end