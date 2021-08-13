class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :musician_profile, dependent: :destroy
  has_one :shop_profile, dependent: :destroy
  has_many :reviews, dependent: :destroy

  enum end_user_status: {musician:1, shop:2}
end