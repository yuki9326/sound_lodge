class Admin::ShopProfilesController < ApplicationController

  def show
    @shop_profile = ShopProfile.find(params[:id])
    @end_user = @shop_profile.end_user
    @shop_reviews = ShopReview.where(shop_profile_id: params[:id])
  end

  def index
    @shop_profiles = ShopProfile.all
  end

  def edit
    @shop_profile = ShopProfile.find(params[:id])
  end

  def update
    @shop_profile = ShopProfile.find(params[:id])
    if @shop_profile.update(shop_profile_params)
      redirect_to admin_shop_profile_path(@shop_profile.id)
    else
      render :edit
    end
  end

  private

  def shop_profile_params
    params.require(:shop_profile).permit(:genre, :end_user_id, :review_id, :shop_name, :area, :is_vocal, :shop_image, :image, :audio_equipment, :introduction, :price, :rate)
  end

end
