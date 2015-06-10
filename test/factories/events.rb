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
  end
end
