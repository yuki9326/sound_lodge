class Public::ShopReviewsController < ApplicationController

  def index
    @shop_reviews = Review.where(shop_profile_id: params[:shop_profile_id])
  end

  def create
    @shop_review = Review.new(review_params)
    @shop_review.shop_profile_id = params[:shop_profile_id]
    @shop_review.end_user_id = current_end_user.id
    @shop_reviews.save
    redirect_to shop_profile_shop_review_path(@shop_review.shop_profile, @shop_review)
  end

  def show
    @shop_review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:rate, :comment)
  end
end
