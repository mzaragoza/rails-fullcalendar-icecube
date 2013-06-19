class EventsController < ApplicationController
  expose(:events){ Event.all }
  expose(:event){
    if params[:id]
      Event.find(params[:id])
    else
      Event.new 
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
    #debugger
    e = Event.new(params[:event])
    e.save
    flash[:notice] = 'Event Created'
    redirect_to root_path
  end
  def update
    e = Event.find(params[:id])
    e.update_attributes(params[:event])
    flash[:notice] = 'Event Updated'
    redirect_to root_path
  end
  def destroy
    event.destroy
    redirect_to root_path
  end
end
