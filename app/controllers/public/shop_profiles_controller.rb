class Public::ShopProfilesController < ApplicationController

  def new
    @shop_profile = ShopProfile.new
  end

  def index
    @shop_profiles = ShopProfile.order(created_at: :desc).limit(20)
    if params[:genre].present? && params[:area].present?
      @shop_profiles = @shop_profiles.get_by_genre(params[:genre],params[:area])
    end
  end

  def create
    @shop_profile = ShopProfile.new(shop_profile_params)
    @shop_profile.end_user_id = current_end_user.id
    if @shop_profile.save
      redirect_to shop_profile_path(@shop_profile.id)
    else
      render :new
    end
  end

  def show
    @shop_profile = ShopProfile.find(params[:id])
    @review = Review.new
  end

  def edit
    @shop_profile = ShopProfile.find(params[:id])
  end

  def update
    @shop_profile = ShopProfile.find(params[:id])
    if @shop_profile.update(shop_profile_params)
      redirect_to shop_profile_path(@shop_profile.id)
    else
      render :edit
    end
  end

  private

  def shop_profile_params
    params.require(:shop_profile).permit(:genre, :end_user_id, :review_id, :username, :shop_name, :area, :is_vocal, :shop_image, :image, :audio_equipment, :introduction, :price, :rate)
  end
end
