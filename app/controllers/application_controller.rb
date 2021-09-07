class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  @notification_message = Notification.where.not(message_id: nil)
  @notification_favorite = Notification.where.not(musician_favorite_id: nil, shop_favorite_id: nil)
  @notification_review = Notification.where.not(musician_review_id: nil, shop_review_id: nil)

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:end_user_status, :name, :username])
  end


end
