require 'test_helper'

describe Event do

  before do
    @event = create :event
  end

  it "should be valid" do
    assert @event.valid?
    assert @event.schedule.all_occurrences.length == 1
  end

end
