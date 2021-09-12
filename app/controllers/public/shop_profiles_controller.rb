class Public::ShopProfilesController < ApplicationController
  before_action :authenticate_end_user!, except:[:index, :show]

  def new
    @shop_profile = ShopProfile.new
    @shop_profile.end_user = current_end_user
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
    @shop_review = ShopReview.new
    @shop_reviews = ShopReview.where(shop_profile_id: params[:id])
    @room = RoomUser.find_by(room_id: current_end_user.room_users.pluck(:room_id), end_user_id: @shop_profile.end_user_id)&.room if end_user_signed_in?
    Notification.where.not(shop_favorite_id: nil).update_all(is_read: true)
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

  def search
    @shop_profiles = ShopProfile.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private

  def shop_profile_params
    params.require(:shop_profile).permit(:genre, :end_user_id, :review_id, :shop_name, :area, :is_vocal, :shop_image, :image, :audio_equipment, :introduction, :price, :rate)
  end

  def redirect_sessions
    redirect_to new_end_user_session_path unless end_user_signed_in?
  end
end
