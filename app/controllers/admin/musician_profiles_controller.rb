class Admin::MusicianProfilesController < ApplicationController

  def index
    @musician_profiles = MusicianProfile.all
  end

  def show
    @musician_profile = MusicianProfile.find(params[:id])
  end
end
