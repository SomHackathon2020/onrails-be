class Friendship < ActiveRecord::Base
  belongs_to :friendly, class_name: 'User', foreign_key:  :user_id
  belongs_to :friends, class_name: 'User', foreign_key: :other_user_id

end