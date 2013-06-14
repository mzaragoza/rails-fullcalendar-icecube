require 'ice_cube_methods'
class Event < ActiveRecord::Base
  include IceCubeMethods
  belongs_to :calendar
  attr_accessible :description, :name, :calendar_id
  validates_presence_of :name
  def color
    if calendar.color
      calendar.color
    else
      'lightblue'
    end
  end
end
