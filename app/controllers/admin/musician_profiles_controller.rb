class Admin::MusicianProfilesController < ApplicationController

  def show
    @musician_profile = MusicianProfile.find(params[:id])
  end

  def index
    @musician_profiles = MusicianProfile.all
  end
end
