class UserBadge
  include Mongoid::Document
  belongs_to :badge
  embedded_in :user_badge
end
