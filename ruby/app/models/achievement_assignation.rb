class AchievementAssignation < ActiveRecord::Base
  belongs_to :users, class_name: "User", foreign_key:  :user_id
  belongs_to :achievements, class_name: "Achievement", foreign_key: :achievement_id
end