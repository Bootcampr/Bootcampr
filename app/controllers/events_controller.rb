class EventsController < ApplicationController


  def index
    @events = Event.all.order(:date, :time)
    # @january = []
    # @february = []
    # @march = []
    # @april = []
    # @may = []
    # @june = []
    # @july = []
    # @august = []
    # @september = []
    # @october = []
    # @november = []
    # @december = []
    # # :nocov:
    # @events.each do |e|
    #   case e.month
    #   when '01'
    #     @january << e
    #   when '02'
    #     @february << e
    #   when '03'
    #     @march << e
    #   when '04'
    #     @april << e
    #   when '05'
    #     @may << e
    #   when '06'
    #     @june << e
    #   when '07'
    #     @july << e
    #   when '08'
    #     @august << e
    #   when '09'
    #     @september << e
    #   when '10'
    #     @october << e
    #   when '11'
    #     @november << e
    #   when '12'
    #     @december << e
    #   end
    # end
    # # :nocov:
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
