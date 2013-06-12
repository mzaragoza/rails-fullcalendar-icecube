class EventInstancesController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    #@event_instances = EventInstance.occurrences_between(Date.parse('2013-01-01'),Date.parse('2013-04-30'))
    @event_instances = EventInstance.occurrences_between(Date.parse('2010-01-01'),Date.parse('2015-04-30'))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_instances }
    end
  end
end
