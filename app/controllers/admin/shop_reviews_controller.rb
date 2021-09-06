class Admin::ShopReviewsController < ApplicationController

  def index
    @shop_reviews = ShopReview.where(shop_profile_id: params[:shop_profile_id])
  end
end
