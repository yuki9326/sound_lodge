class Public::ShopReviewsController < ApplicationController
  before_action :authenticate_end_user!, except:[:index]

  def index
    @shop_reviews = ShopReview.where(shop_profile_id: params[:shop_profile_id])
    @shop_profile = ShopProfile.find(params[:shop_profile_id])
    Notification.where.not(shop_review_id: nil).update_all(is_read: true)
  end

  def create
    @shop_review = ShopReview.new(shop_review_params)
    @shop_review.shop_profile_id = params[:shop_profile_id]
    @shop_review.end_user_id = current_end_user.id
    @shop_review.comment = params[:shop_review][:comment]
    if @shop_review.save
      Notification.create(end_user_id: @shop_review.shop_profile.end_user_id, shop_review_id: @shop_review.shop_profile_id)
    end
    redirect_to shop_profile_shop_review_path(@shop_review.shop_profile, @shop_review)
  end

  def show
    @shop_review = ShopReview.find(params[:id])
    @shop_profile = @shop_review.shop_profile
  end

  private

  def shop_review_params
    params.require(:shop_review).permit(:rate, :comment)
  end

  def redirect_sessions
    redirect_to new_end_user_session_path unless end_user_signed_in?
  end
end
