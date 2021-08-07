class Admin::MusicianProfilesController < ApplicationController

  def show
    @musician_profile = MusicianProfile.find(params[:id])
  end
end
