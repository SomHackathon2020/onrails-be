class Event < ActiveRecord::Base
  attr_accessor :distance

  has_many :users_list, foreign_key: :user_id, class_name: 'EventAssignation'
  has_many :users, through: :users_list

  # def distance=(val)
  #   @distance = val
  # end

  def as_json(*args)
    hash = super(*args)
    hash.merge(:distance => distance)
  end

end