class Friendship < ActiveRecord::Base
  belongs_to :friendly, class_name: 'Player', foreign_key:  :user_id
  belongs_to :friends, class_name: 'Player', foreign_key: :other_player_id

end