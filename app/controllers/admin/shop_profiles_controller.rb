class Admin::ShopProfilesController < ApplicationController

  def show
    @shop_profile = ShopProfile.find(params[:id])
  end

  def index
    @shop_profiles = ShopProfile.all
  end
end
