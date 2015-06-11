FactoryGirl.define do
  factory :event do
    name        'Test Event'
    from_date   Date.parse('2015/7/10')
    from_time   Time.parse('2015/7/10 10:00AM')
    to_date     Date.parse('2015/7/10')
    to_time     Time.parse('2015/7/10 2:00PM')
    time_zone   'UTC'
    repeats     'never'
    calendar

    factory :event_daily_repeat do
      repeats               'daily'
      repeats_every_n_days  1
      repeat_ends           'on'
      repeat_ends_on        Date.parse('2015/7/10') + 2.days
    end

    factory :event_weekly_repeat do
      repeats                               'weekly'
      repeats_every_n_weeks                 1
      repeats_weekly_each_days_of_the_week  ['sunday', 'monday']
      repeat_ends                           'on'
      repeat_ends_on                        Date.parse('2015/7/10') + 2.weeks
    end

    factory :event_monthly_repeat_each do
      repeats                                  'monthly'
      repeats_monthly                          'each'
      repeats_every_n_months                   1
      repeats_monthly_each_days_of_the_month   [1]
      repeat_ends                              'on'
      repeat_ends_on                           Date.parse('2015/7/10').months_since(2)
    end

    factory :event_monthly_repeat_on do
      repeats                               'monthly'
      repeats_monthly                       'on'
      repeats_monthly_on_days_of_the_week   ['sunday', 'monday']
      repeats_monthly_on_ordinals           [0, 1]
      repeats_every_n_months                1
      repeat_ends                           'on'
      repeat_ends_on                        Date.parse('2015/7/10').months_since(2)
    end

    factory :event_yearly_repeat do
      repeats                                  'yearly'
      repeats_yearly_on                        false
      repeats_yearly_each_months_of_the_year   ['january', 'february']
      repeats_every_n_years                    1
      repeat_ends                              'on'
      repeat_ends_on                           Date.parse('2015/7/10') + 2.years
    end

    factory :event_yearly_repeat_on do
      repeats                                  'yearly'
      repeats_yearly_on                        true
      repeats_yearly_on_days_of_the_week       ['sunday', 'monday']
      repeats_yearly_on_ordinals               [0, 1]
      repeats_yearly_each_months_of_the_year   ['january']
      repeats_every_n_years                    1
      repeat_ends                              'on'
      repeat_ends_on                           Date.parse('2015/7/10') + 2.years
    end
  end
end
