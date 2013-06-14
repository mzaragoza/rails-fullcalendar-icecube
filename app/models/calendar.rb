class Calendar < ActiveRecord::Base
  has_many :events, :dependent => :destroy
  attr_accessible :name, :color, :description
end

