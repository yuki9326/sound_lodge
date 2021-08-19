class Public::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def create
  @review = Review.new(review_params)
  @review.end_user_id = current_end_user.id
  @review.save
  redirect_to musician_profile_review_path(@review.id)
  end

  def show
  @review = Review.find(params[:id])
  end

 private

 def review_params
   params.require(:review).permit(:rate, :comment)
 end
end
