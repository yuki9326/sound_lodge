class Room < ApplicationRecord
  has_many :room_users
  has_many :end_users, through: :room_users, dependent: :destroy
end
