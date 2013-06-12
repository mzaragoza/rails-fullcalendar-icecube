class CalendarsController < ApplicationController
  expose(:events){ Event.all }
  def index

  end
end
