class User < ActiveRecord::Base
  has_many :friendships_list, foreign_key: :user_id, class_name: 'Friendship'
  has_many :friends, through: :friendships_list

  has_many :on_friendship_list, foreign_key: :other_user_id, class_name: 'Friendship'
  has_many :frienlies, through: :on_friendship_list
end