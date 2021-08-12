class Public::EndUsersController < ApplicationController

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
  end

  def update
  end

  def confirm
  end

  def unsubscribe
  end
end
