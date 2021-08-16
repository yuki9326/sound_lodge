class Public::EndUsersController < ApplicationController

  def show
    @end_user = EndUser.find(params[:id])
    @end_user.musician_profile.id = current_end_user.musician_profile.id
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
  end

  def confirm
  end

  def unsubscribe
  end
end
