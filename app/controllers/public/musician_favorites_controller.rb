class Public::MusicianFavoritesController < ApplicationController
  before_action :musician_profile_params
    def create
        favorite = current_end_user.favorites.new(musician_profile_id: @musician_profile.id)
        favorite.save
    end

    def destroy
      @favorite = Favorite.find_by(end_user_id: current_end_user.id, musician_profile_id: @musician_profile.id).destroy
    end

    private

    def musician_profile_params
      @musician_profile = MusicianProfile.find(params[:musician_profile_id])
    end
end
