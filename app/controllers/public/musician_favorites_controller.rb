class Public::MusicianFavoritesController < ApplicationController
  before_action :musician_profile_params
    def create
        musician_favorite = current_end_user.musician_favorites.new(musician_profile_id: @musician_profile.id)
        musician_favorite.save
    end

    def destroy
      @musician_favorite = MusicianFavorite.find_by(end_user_id: current_end_user.id, musician_profile_id: @musician_profile.id).destroy
    end

    private

    def musician_profile_params
      @musician_profile = MusicianProfile.find(params[:musician_profile_id])
    end
end
