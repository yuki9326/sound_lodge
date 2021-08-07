class Admin::ShopProfilesController < ApplicationController

  def show
    @shop_profile = ShopProfile.find(params[:id])
  end
end
