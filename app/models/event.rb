require 'ice_cube_methods'
class Event < ActiveRecord::Base
  include IceCubeMethods
  attr_accessible :description, :name
  validates :name, :presence => true
end
