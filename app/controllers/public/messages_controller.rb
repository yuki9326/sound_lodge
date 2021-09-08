class Public::MessagesController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:end_user)
    Notification.where(end_user_id: current_end_user.id).where.not(message_id: nil).update_all(is_read: true)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      Notification.create(end_user_id: current_end_user.id, message_id: @message.id)
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

  def redirect_sessions
    redirect_to new_end_user_session_path unless end_user_signed_in?
  end

end
