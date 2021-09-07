class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :message, optional: true
  has_many :shop_favorites, primary_key: 'shop_favorite_id', foreign_key: 'id'
end
