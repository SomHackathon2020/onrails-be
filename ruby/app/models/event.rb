class Event < ActiveRecord::Base
  has_many :users_list, foreign_key: :user_id, class_name: 'EventAssignation'
  has_many :users, through: :users_list
end