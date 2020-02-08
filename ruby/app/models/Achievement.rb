class Achievement < ActiveRecord::Base
  has_many :users_list, foreign_key: :users_id, class_name: 'AchievementAssignation'
  has_many :users, through: :users_list
end