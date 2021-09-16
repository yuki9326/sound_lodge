class Admin::MusicianProfilesController < ApplicationController

  def show
    @musician_profile = MusicianProfile.find(params[:id])
    @end_user = @musician_profile.end_user
    @musician_reviews = MusicianReview.where(musician_profile_id: params[:id])
  end

  def index
    @musician_profiles = MusicianProfile.all
  end
end
