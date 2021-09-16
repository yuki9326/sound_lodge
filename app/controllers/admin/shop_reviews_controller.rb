class Admin::ShopReviewsController < ApplicationController

  def index
    @shop_reviews = ShopReview.where(shop_profile_id: params[:shop_profile_id])
    @shop_profile = ShopProfile.find(params[:shop_profile_id])
  end
end
