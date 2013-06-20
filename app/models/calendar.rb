class Calendar < ActiveRecord::Base
  has_many :events, :dependent => :destroy
  attr_accessible :name, :color, :description
  validates_presence_of :name, :color
end

