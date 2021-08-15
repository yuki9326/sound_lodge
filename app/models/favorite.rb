class Favorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :musician_profile
  belongs_to :shop_profile
end
