class Public::NotificationsController < ApplicationController
  def index
    @notification_message = Notification.where(end_user_id: current_end_user.id, musician_favorite_id: nil, musician_review_id: nil, shop_favorite_id: nil, shop_review_id: nil)
    @notification_favorite = Notification.where(end_user_id: current_end_user.id, message_id: nil, musician_favorite_id: nil, musician_review_id: nil, shop_review_id: nil)
    @notification_review = Notification.where(end_user_id: current_end_user.id, musician_favorite_id: nil, shop_favorite_id: nil, message_id: nil)
    Notification.where(end_user_id: current_end_user.id).update_all(is_read: true)
  end
end
