class EventAttendeesController < ApplicationController
  before_action :set_event

  def index
    @attendees = @event.attendees
  end

  def new
    @attendee = @event.attendees.new
  end

  def create
    @attendee = @event.attendees.new(params_attendee)
    if @attendee.save
      flash[:notice] = '新增成功'
      redirect_to event_attendees_path(@event)
    else
      render :new
    end
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def params_attendee
    params.require(:attendee).permit(:name)
  end
end
