class AchievementAssignation < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: :user_id
  belongs_to :achievement, class_name: "Achievement", foreign_key: :achievement_id
end