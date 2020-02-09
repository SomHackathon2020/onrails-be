class AchievementAssignation < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :achievement, class_name: "Achievement"
end