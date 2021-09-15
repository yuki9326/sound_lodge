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

  def after_sign_in_path_for(resource)
    case resource
    when :admin
      admin_path
    when :end_user
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :end_user
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:end_user_status, :name, :username])
  end

end
