class Public::MusicianReviewsController < ApplicationController

  def index
    @musician_reviews = Review.where(musician_profile_id: params[:musician_profile_id])
  end

  def create
    @musician_review = Review.new(review_params)
    @musician_review.musician_profile_id = params[:musician_profile_id]
    @musician_review.end_user_id = current_end_user.id
    @musician_review.comment = params[:comment]
    @musician_review.save
    redirect_to musician_profile_musician_review_path(@musician_review.musician_profile, @musician_review)
  end

  def show
    @musician_review = Review.find(params[:id])
  end

 private

 def review_params
   params.require(:review).permit(:rate, :comment)
 end
end

