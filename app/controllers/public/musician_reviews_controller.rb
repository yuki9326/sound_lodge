class Public::MusicianReviewsController < ApplicationController

  def index
    @reviews = Review.all
    render "public/musician_profiles/reviews/index"
  end

  def create
  @review = Review.new(review_params)
  @review.end_user_id = current_end_user.id
  @review.save
  redirect_to review_path(@musician_profile.id)
  end

  def show
  @review = Review.find(params[:id])
  end

 private

 def review_params
   params.require(:review).permit(:rate, :comment)
 end
end

