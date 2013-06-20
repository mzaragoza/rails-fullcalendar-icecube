class CalendarsController < ApplicationController
  expose(:events){ Event.all }
  expose(:calendars){ Calendar.all }
  expose(:calendar){
    if params[:id]
      Calendar.find(params[:id])
    elsif params[:calendar][:id]
      Calendar.find(params[:calendar][:id])
    elsif params[:calendar]
      Calendar.new(params[:calendar])
    end
  }

  def index
    #render :json => calendars.map{|c| {:key => c.id, :label => c.name}}, :layout => false
  end
  def test
    render :layout => false
  end

  def create
    if calendar.save
      flash[:notice] = 'Calendar was successfully created'
      redirect_to(root_path)
    end
  end

  def update
    if calendar.save
      flash[:notice] = 'calendar was successfully updated'
      redirect_to(root_path)
    end
  end
  def destroy
    calendar.destroy
    redirect_to root_path
  end
end
