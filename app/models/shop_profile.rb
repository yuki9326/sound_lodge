class ShopProfile < ApplicationRecord
  attachment :image, :shop_image
  belongs_to :genre
  belongs_to :end_user
end
