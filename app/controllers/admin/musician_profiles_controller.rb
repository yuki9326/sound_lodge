class Admin::MusicianProfilesController < ApplicationController

  def show
    @musician_profile = MusicianProfile.find(params[:id])
    @end_user = @musician_profile.end_user
    @musician_reviews = MusicianReview.where(musician_profile_id: params[:id])
  end

  def index
    @musician_profiles = MusicianProfile.all
  end

  def edit
    @musician_profile = MusicianProfile.find(params[:id])
  end

  def update
    @musician_profile = MusicianProfile.find(params[:id])
    if @musician_profile.update(musician_profile_params)
      redirect_to admin_musician_profile_path(@musician_profile.id)
    else
      render :edit
    end
  end

  private

  def musician_profile_params
    params.require(:musician_profile).permit(:genre, :end_user_id, :review_id, :area, :instrument, :total_member, :is_vocal, :video, :introduction, :price, :rate, :image)
  end

end
