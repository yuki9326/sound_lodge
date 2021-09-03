class Public::EndUsersController < ApplicationController

  def show
    @end_user = EndUser.find(params[:id])
    if @end_user.end_user_status == "musician"
      @end_user.musician_profile.id = current_end_user.musician_profile.id
    else
      @end_user.shop_profile.id = current_end_user.shop_profile.id
    end

    if @end_user.end_user_status == "musician"
      @shop_ranks_all = ShopProfile.where(id: ShopFavorite.group(:shop_profile_id).order('count(shop_profile_id) desc').pluck(:shop_profile_id))
      @shop_ranks_filter = @shop_ranks_all.where(area: @end_user.musician_profile.area)
      @shop_ranks = []
      @shop_ranks << @shop_ranks_filter
      if @shop_ranks.flatten.count < 3
        @shop_ranks << @shop_ranks_all
      end
      @shop_ranks = @shop_ranks.flatten.take(3)

    else
      @musician_ranks_all = MusicianProfile.where(id: MusicianFavorite.group(:musician_profile_id).order('count(musician_profile_id) desc').pluck(:musician_profile_id))
      @musician_ranks_filter = @musician_ranks_all.where(area: @end_user.shop_profile.area)
      @musician_ranks = []
      @musician_ranks << @musician_ranks_filter
      if @musician_ranks.flatten.count < 3
        @musician_ranks << @musician_ranks_all
      end
      @musician_ranks = @musician_ranks.flatten.take(3)
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
