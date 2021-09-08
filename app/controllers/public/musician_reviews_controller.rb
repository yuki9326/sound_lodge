class Public::MusicianReviewsController < ApplicationController
  before_action :authenticate_end_user!, only:[:create, :show]

  def index
    @musician_reviews = MusicianReview.where(musician_profile_id: params[:musician_profile_id])
    Notification.where.not(musician_review_id: nil).update_all(is_read: true)
  end

  def create
    @musician_review = MusicianReview.new(musician_review_params)
    @musician_review.musician_profile_id = params[:musician_profile_id]
    @musician_review.end_user_id = current_end_user.id
    @musician_review.comment = params[:musician_review][:comment]
    if @musician_review.save
      Notification.create(end_user_id: musician_review.end_user_id, musician_review_id: musician_review.musician_profile_id)
    end
    redirect_to musician_profile_musician_review_path(@musician_review.musician_profile, @musician_review)
  end

  def show
    @musician_review = MusicianReview.find(params[:id])
  end

 private

 def musician_review_params
   params.require(:musician_review).permit(:rate, :comment)
 end

 def redirect_sessions
    redirect_to new_end_user_session_path unless end_user_signed_in?
 end
end

