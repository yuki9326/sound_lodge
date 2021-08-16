class Review < ApplicationRecord
  belongs_to :end_user
  belongs_to :musician_profile
  belongs_to :shop_profile

  validates :score, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
