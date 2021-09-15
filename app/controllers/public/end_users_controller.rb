class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!

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
    @musician_profile = @end_user.musician_profile
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    before_end_user_status = @end_user.end_user_status

    if @end_user.update(end_user_params)
      if before_end_user_status == @end_user.end_user_status
        redirect_to end_user_path(@end_user.id)
        #return
      else
        if @end_user.end_user_status == "musician"
          @end_user.shop_profile.destroy
          redirect_to new_musician_profile_path
        else
          @end_user.musician_profile.destroy
          redirect_to new_shop_profile_path
        end
      end

      #redirect_to end_user_path(@end_user.id)
    else
      render :edit
    end
  end

  def confirm
    @end_user = current_end_user
  end

  def unsubscribe
    @end_user = current_end_user
    @end_user.destroy
    reset_session
    redirect_to root_path
  end

  def favorite_list
    if current_end_user.end_user_status == "musician"
      @shop_lists = current_end_user.shop_favorites
      render :shop_favorite_list
    else
      @musician_lists = current_end_user.musician_favorites
      render :musician_favorite_list
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :email, :end_user_status, :is_active)
  end

  def redirect_sessions
    redirect_to new_end_user_session_path unless end_user_signed_in?
  end
end
