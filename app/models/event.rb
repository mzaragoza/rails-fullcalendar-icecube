require 'ice_cube_methods'
class Event < ActiveRecord::Base
  include IceCubeMethods
  belongs_to :calendar
  attr_accessible :description, :name, :calendar_id
  attr_accessible :repeats_weekly_each_days_of_the_week_mask, :repeats_monthly_each_days_of_the_month_mask, :repeats_monthly_on_ordinals_mask, :repeats_monthly_on_days_of_the_week_mask, :repeats_yearly_each_months_of_the_year_mask, :repeats_yearly_on_ordinals_mask, :repeats_yearly_on_days_of_the_week_mask
  validates_presence_of :name
  def color
    if calendar.color
      calendar.color
    else
      'lightblue'
    end
  end
end
