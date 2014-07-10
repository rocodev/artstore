class Product < ActiveRecord::Base
  mount_uploader :image , ImagicUploader
end
