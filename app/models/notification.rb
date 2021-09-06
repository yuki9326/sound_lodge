class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :message, optional: true
  belongs_to :visitor, class_name: 'EndUser', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'EndUser', foreign_key: 'visited_id', optional: true
end
