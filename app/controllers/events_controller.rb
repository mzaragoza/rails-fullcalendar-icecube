class EventsController < ApplicationController
  expose(:events){ Event.all }
  expose(:event){
    if params[:action] == 'new'
      Event.new()
    elsif params[:action] == 'create'
      Event.new(params[:event])
    elsif params[:action] == 'show' || params[:action] == 'edit'
      Event.find(params[:id])
    end
  }
  def new
  end
  def show
  end
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: events }
    end
  end
  def create
    if params[:event][:from_date].empty?
      params[:event][:from_date] = Date.today
    end
    if params[:event][:to_date].empty?
      params[:event][:to_date] = Date.today
    end
    if params[:event][:is_all_day] == '0'
      if params[:event][:from_time].empty?
        params[:event][:from_time] = Time.now.beginning_of_day
      end
      if params[:event][:to_time].empty?
        params[:event][:to_time] = Time.now.end_of_day
      end
    end
    if event.save
      flash[:notice] = 'Event Created'
      redirect_to root_path
    else
      render :new
    end
  end
  def update
    e = Event.find(params[:id])
    e.update_attributes(params[:event])
    flash[:notice] = 'Event Updated'
    redirect_to root_path
  end
  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to root_path
  end
end
