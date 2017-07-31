class AttendanceController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @attendee = User.find(current_user.id)
    @event.attendees << @attendee
    @attendance = Attendance.find_by(event: @event, attendee: @attendee)

    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.json
    end
    
  end
end
