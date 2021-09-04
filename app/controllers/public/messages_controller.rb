class Public::MessagesController < ApplicationController

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:end_user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:end_user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(end_user_id: current_end_user.id)
  end

end
