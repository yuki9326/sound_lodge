class ShopReview < ApplicationRecord
  belongs_to :end_user
  belongs_to :shop_image
end
