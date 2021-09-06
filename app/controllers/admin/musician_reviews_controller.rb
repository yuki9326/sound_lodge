class Admin::MusicianReviewsController < ApplicationController

  def index
    @musician_reviews = MusicianReview.where(musician_profile_id: params[:musician_profile_id])
  end
end
