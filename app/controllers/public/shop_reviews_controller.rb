class Public::ShopReviewsController < ApplicationController

  def index
    @shop_reviews = ShopReview.where(shop_profile_id: params[:shop_profile_id])
  end

  def create
    @shop_review = ShopReview.new(shop_review_params)
    @shop_review.shop_profile_id = params[:shop_profile_id]
    @shop_review.end_user_id = current_end_user.id
    @shop_review.comment = params[:shop_review][:comment]
    @shop_review.save
    redirect_to shop_profile_shop_review_path(@shop_review.shop_profile, @shop_review)
  end

  def show
    @shop_review = ShopReview.find(params[:id])
  end

  private

  def shop_review_params
    params.require(:shop_review).permit(:rate, :comment)
  end
end
