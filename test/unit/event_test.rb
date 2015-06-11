require 'test_helper'

describe Event do

  before do
    @event = create :event
  end

  it "should be valid" do
    assert @event.valid?
    assert @event.schedule.all_occurrences.length == 1
  end

  describe "can repeat events" do

    it "repeats the event daily" do
      event_daily_repeat = create :event_daily_repeat

      assert event_daily_repeat.schedule.all_occurrences.length == 3
      assert event_daily_repeat.schedule.occurs_on?(event_daily_repeat.from_date)
      assert event_daily_repeat.schedule.occurs_on?(event_daily_repeat.from_date + 1.day)
      assert event_daily_repeat.schedule.occurs_on?(event_daily_repeat.from_date + 2.days)
      refute event_daily_repeat.schedule.occurs_on?(event_daily_repeat.from_date + 3.days)
    end

    it "repeats the event weekly" do
      event_weekly_repeat = create :event_weekly_repeat

      assert event_weekly_repeat.schedule.all_occurrences.length == 4
      next_sunday = event_weekly_repeat.from_date - event_weekly_repeat.from_date.wday.days + 7.days
      assert event_weekly_repeat.schedule.occurs_on?(next_sunday)
      next_wednesday = event_weekly_repeat.from_date - event_weekly_repeat.from_date.wday.days + 9.days
      refute event_weekly_repeat.schedule.occurs_on?(next_wednesday)
    end

  end

end
