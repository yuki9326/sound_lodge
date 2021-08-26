class ShopFavorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :shop_profile

  validates_uniqueness_of :shop_profile_id, scope: :end_user_id
end
