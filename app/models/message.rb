class Message < ApplicationRecord

  belongs_to :room
  belongs_to :end_user
end