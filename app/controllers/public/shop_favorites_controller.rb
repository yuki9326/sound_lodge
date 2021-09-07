class Public::ShopFavoritesController < ApplicationController
  before_action :shop_profile_params
    def create
        shop_favorite = current_end_user.shop_favorites.new(shop_profile_id: @shop_profile.id)
        if shop_favorite.save
          Notification.create(end_user_id: shop_favorite.end_user_id, shop_favorite_id: shop_favorite.shop_profile_id)
        end
    end

    def destroy
      @shop_favorite = ShopFavorite.find_by(end_user_id: current_end_user.id, shop_profile_id: @shop_profile.id).destroy
    end

    private

    def shop_profile_params
      @shop_profile = ShopProfile.find(params[:shop_profile_id])
    end
end
