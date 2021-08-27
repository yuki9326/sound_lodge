class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :musician_profile, dependent: :destroy
  has_one :shop_profile, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :musician_favorites, dependent: :destroy
  has_many :shop_favorites, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def already_musician_favorited?(musician_profile)
    self.musician_favorites.exists?(musician_profile_id: musician_profile.id)
  end

  def already_shop_favorited?(shop_profile)
    self.shop_favorites.exists?(shop_profile_id: shop_profile.id)
  end
  enum end_user_status: {musician:1, shop:2}
end