class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :notification_check

  def notification_check
    if end_user_signed_in?
      @notification_message = Notification.where(end_user_id: current_end_user.id, musician_favorite_id: nil, musician_review_id: nil, shop_favorite_id: nil, shop_review_id: nil, is_read: false)
      @notification_favorite = Notification.where(end_user_id: current_end_user.id, message_id: nil, musician_review_id: nil, shop_review_id: nil, is_read: false)
      @notification_review = Notification.where(end_user_id: current_end_user.id, musician_favorite_id: nil, shop_favorite_id: nil, message_id: nil, is_read: false)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:end_user_status, :name, :username])
  end


end
