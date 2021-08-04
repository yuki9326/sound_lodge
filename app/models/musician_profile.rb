class MusicianProfile < ApplicationRecord
  has_one_attached :video
  attachment :image
  belongs_to :end_user
  belongs_to :genre
end
