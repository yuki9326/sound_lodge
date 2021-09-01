class Public::EndUsersController < ApplicationController

  def show
    @end_user = EndUser.find(params[:id])
    if @end_user.end_user_status == "musician"
      @end_user.musician_profile.id = current_end_user.musician_profile.id
    else
      @end_user.shop_profile.id = current_end_user.shop_profile.id
    end

    if @end_user.end_user_status == "musician"
      @shop_ranks = ShopProfile.find(ShopFavorite.group(:shop_profile_id).order('count(shop_profile_id) desc').limit(3).pluck(:shop_profile_id))
    else
      @musician_ranks = MusicianProfile.find(MusicianProfile.group(:musician_profile).order('count(musician_profile_id) desc').limit(3).pluck(:musician_profile_id))
    end
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to end_user_path(@end_user.id)
    else
      render :edit
    end
  end

  def confirm
    @end_user = current_end_user
  end

  def unsubscribe
    @end_user = current_end_user
    @end_user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :email, :end_user_status, :is_active)
  end
end
