class MusicianFavorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :musician_profile
end
