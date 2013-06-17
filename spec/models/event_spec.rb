require 'spec_helper'

describe Event do
  calendar = Calendar.create!( name: 'Sample Calendar', color: '#ffff00')
  it "happends one time" do
   event =  Event.create!( name: 'one time event',
                           description: '',
                           is_all_day: false,
                           from_date: 'Mon, 17 Jun 2013',
                           from_time: '2000-01-01 09:00:00 UTC',
                           to_date: 'Mon, 17 Jun 2013',
                           to_time: '2000-01-01 17:00:00 UTC',
                           repeats: 'never',
                           repeats_every_n_days: nil,
                           repeats_every_n_weeks: nil,
                           repeats_every_n_months: nil,
                           repeats_monthly: 'each',
                           repeats_every_n_years: nil,
                           repeats_yearly_on: false,
                           repeat_ends: 'never',
                           repeat_ends_on: 'Mon, 17 Jun 2013',
                           time_zone: 'Eastern Time (US & Canada)',
                           calendar_id: calendar.id)
   expect(event.schedule.first(5)).to eq(['Mon, 17 Jun 2013 09:00:00 EDT -04:00'])
  end

  it "happends one time all day" do
   event =  Event.create!( name: 'one time event all day',
                           description: '',
                           is_all_day: true,
                           from_date: 'Mon, 17 Jun 2013',
                           from_time: '2000-01-01 00:00:00 UTC',
                           to_date: 'Mon, 17 Jun 2013',
                           to_time: '2000-01-01 00:00:00 UTC',
                           repeats: 'never',
                           repeats_every_n_days: nil,
                           repeats_every_n_weeks: nil,
                           repeats_every_n_months: nil,
                           repeats_monthly: 'each',
                           repeats_every_n_years: nil,
                           repeats_yearly_on: false,
                           repeat_ends: 'never',
                           repeat_ends_on: 'Mon, 17 Jun 2013',
                           time_zone: 'Eastern Time (US & Canada)',
                           calendar_id: calendar.id)
   expect(event.schedule.first(5)).to eq(['Mon, 17 Jun 2013 00:00:00 EDT -04:00'])
  end

  it "happends every 4 days" do
   event =  Event.create!( name: 'every 4 day event',
                           description: '',
                           is_all_day: false,
                           from_date: 'Mon, 17 Jun 2013',
                           from_time: '2000-01-01 09:00:00 UTC',
                           to_date: 'Mon, 17 Jun 2013',
                           to_time: '2000-01-01 17:00:00 UTC',
                           repeats: 'daily',
                           repeats_every_n_days: 4,
                           repeats_every_n_weeks: nil,
                           repeats_every_n_months: nil,
                           repeats_monthly: 'each',
                           repeats_every_n_years: nil,
                           repeats_yearly_on: false,
                           repeat_ends: 'never',
                           repeat_ends_on: 'Mon, 17 Jun 2013',
                           time_zone: 'Eastern Time (US & Canada)',
                           calendar_id: calendar.id)
   expect(event.schedule.first(5)).to eq(['Mon, 17 Jun 2013 09:00:00 EDT -04:00', 'Fri, 21 Jun 2013 09:00:00 EDT -04:00', 'Tue, 25 Jun 2013 09:00:00 EDT -04:00', 'Sat, 29 Jun 2013 09:00:00 EDT -04:00', 'Wed, 03 Jul 2013 09:00:00 EDT -04:00'])
  end

  it "happends every weekday" do
   event =  Event.create!( name: 'every weekday event',
                           description: '',
                           is_all_day: false,
                           from_date: 'Mon, 17 Jun 2013',
                           from_time: '2000-01-01 09:00:00 UTC',
                           to_date: 'Mon, 17 Jun 2013',
                           to_time: '2000-01-01 17:00:00 UTC',
                           repeats: 'weekly',
                           repeats_every_n_days: nil,
                           repeats_every_n_weeks: 1,
                           repeats_weekly_each_days_of_the_week_mask: 62,
                           repeats_every_n_months: nil,
                           repeats_monthly: 'each',
                           repeats_every_n_years: nil,
                           repeats_yearly_on: false,
                           repeat_ends: 'never',
                           repeat_ends_on: 'Mon, 17 Jun 2013',
                           time_zone: 'Eastern Time (US & Canada)',
                           calendar_id: calendar.id)
   expect(event.schedule.first(7)).to eq(['Mon, 17 Jun 2013 09:00:00 EDT -04:00i', 'Tue, 18 Jun 2013 09:00:00 EDT -04:00', 'Wed, 19 Jun 2013 09:00:00 EDT -04:00', 'Thu, 20 Jun 2013 09:00:00 EDT -04:00', 'Fri, 21 Jun 2013 09:00:00 EDT -04:00', 'Mon, 24 Jun 2013 09:00:00 EDT -04:00', 'Tue, 25 Jun 2013 09:00:00 EDT -04:00'])
  end
end
