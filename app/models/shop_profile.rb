class ShopProfile < ApplicationRecord
  attachment :image
  attachment :shop_image
  belongs_to :genre
  belongs_to :end_user
end
