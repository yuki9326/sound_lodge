class ShopFavorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :shop_profile
end
