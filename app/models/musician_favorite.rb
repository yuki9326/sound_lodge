class MusicianFavorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :musician_profile

  validates_uniqueness_of :musician_profile_id, scope: :end_user_id
end
