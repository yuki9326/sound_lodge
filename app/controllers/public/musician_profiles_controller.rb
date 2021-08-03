class Public::MusicianProfilesController < ApplicationController
  
  def new
    @musician_profile = MusicianProfile.new
  end
  
  def index
    @musician_profiles = MusicianProfile.all
  end
  
  private
  
end
