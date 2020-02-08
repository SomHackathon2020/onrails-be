class Level < ActiveRecord::Base
  has_many :Users, :class_name => 'User'
end