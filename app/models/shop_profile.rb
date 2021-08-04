class ShopProfile < ApplicationRecord
  attachment :image
  belongs_to :genre
  belongs_to :end_user
end
