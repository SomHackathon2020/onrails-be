class User < ActiveRecord::Base
  has_many :friendship_list, foreign_key: :user_id, class_name: 'Friendship'
  has_many :friends, through: :friendship_list

  has_many :on_friendship_list, foreign_key: :other_user_id, class_name: 'Friendship'
  has_many :friendlies, through: :on_friendship_list

  has_many :events_list, foreign_key: :event_id, class_name: 'EventAssignation'
  has_many :events, through: :events_list

  has_many :achievements_list, foreign_key: :achievement_id, class_name: 'AchievementAssignation'
  has_many :achievements, through: :achievements_list


  has_many :levels_id, foreign_key: :levels_id, class_name: 'Level'
  has_many :level, through: :levels_id
end
