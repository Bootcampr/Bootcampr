class EventsController < ApplicationController


  def index
    @events = Event.all.order(:date, :time)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.tag_list = event_params[:tag_list]
    @event.owner = current_user
    if @event.save
      redirect_to @event
    else
      render :new, status: 422
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path
  end


  private

  def event_params
    params.require(:event).permit(:title, :date, :time, :location, :summary, :tag_list, :project_id)
  end

end
