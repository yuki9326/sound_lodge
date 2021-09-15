class Public::RoomsController < ApplicationController

  def index
    @end_user = current_end_user
  end

  def new
    @room = Room.new
  end

  def create
    if params[:end_user_ids].count == 2
      @room = Room.new(room_params)
      @room.save
      redirect_to room_messages_path(@room)
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end


  private

  def room_params
    params.permit(end_user_ids: [])
  end
end
