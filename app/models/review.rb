class Review < ApplicationRecord
  belongs_to :end_user
  belongs_to :musician_profile, optional: true
  belongs_to :shop_profile, optional: true


end
