class Admin::MusicianProfilesController < ApplicationController

  def show
    @musician_profile = MusicianProfile.find(params[:id])
    @end_user = @musician_profile.end_user
  end

  def index
    @musician_profiles = MusicianProfile.all
  end
end
