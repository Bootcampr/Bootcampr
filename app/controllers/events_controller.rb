class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      # status 302
      redirect_to "events/#{@event.id}"
    else
      erb :'/events/new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :time, :location, :summary)
  end

end
