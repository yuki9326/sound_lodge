class Favorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :musician_profile
  belongs_to :shop_profile

  validates_uniqueness_of :musician_profile_id, scope: :end_user_id
  validates_uniqueness_of :shop_profile_id, scope: :end_user_id
end
