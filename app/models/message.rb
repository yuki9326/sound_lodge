class Message < ApplicationRecord
  attachment :image
  belongs_to :room
  belongs_to :end_user
  has_many :notifications, dependent: :destroy
  
  
end
