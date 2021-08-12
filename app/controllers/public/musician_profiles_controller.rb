class Public::MusicianProfilesController < ApplicationController

  def new
    @musician_profile = MusicianProfile.new
  end

  def create
    @musician_profile = MusicianProfile.new(musician_profile_params)
    @musician_profile.genre = MusicianProfile.genre_statuses[params[:musician_profile][:genre]]
    @musician_profile.area = MusicianProfile.area_statuses[params[:musician_profile][:area]]
    @musician_profile.end_user_id = current_end_user.id

    if @musician_profile.save
      redirect_to musician_profile_path(@musician_profile.id)
    else
      render :new
    end
  end

  def index
    @musician_profiles = MusicianProfile.all
  end

  def show
    @musician_profile = MusicianProfile.find(params[:id])
    @review = Review.new
  end

  def edit
    @musician_profile = MusicianProfile.find(params[:id])
  end

  def update
    @musician_profile = MusicianProfile.find(params[:id])
    if @musician_profile.update(musician_profile_params)
      redirect_to musician_profile_path(@musician_profile.id)
    else
      render :edit
    end
  end

  private

  def musician_profile_params
    params.require(:musician_profile).permit(:genre, :end_user_id, :review_id, :username, :area, :instrument,:total_member, :is_vocal, :video_id, :introduction, :price, :rate, :image)
  end
end
