class Achievement < ActiveRecord::Base
  has_many :users_list, class_name: 'AchievementAssignation', foreign_key: :users_id
  has_many :users, class_name:"User",  through: :users_list
end