class Purchase < ApplicationRecord
   mount_uploader :image, ImageUploader
   belongs_to: user
   belongs_to: product
   has_one: address
end
