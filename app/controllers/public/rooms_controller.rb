class Public::RoomsController < ApplicationController

  def index
    Notification.where.not(message_id: nil).update_all(is_read: true)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.save
    redirect_to room_messages_path(@room)
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
