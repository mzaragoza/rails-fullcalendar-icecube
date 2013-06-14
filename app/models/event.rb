require 'ice_cube_methods'
class Event < ActiveRecord::Base
  include IceCubeMethods
  belongs_to :event
  attr_accessible :description, :name, :calendar_id
  validates :name, :presence => true
end
