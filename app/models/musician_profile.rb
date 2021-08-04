class MusicianProfile < ApplicationRecord
  has_one_attached :video
  belongs_to :end_user
  belongs_to :genre
end
