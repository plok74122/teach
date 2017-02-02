class EventAttendeesController < ApplicationController
  before_action :set_event
  before_action :set_attendee, :only => [:show, :edit, :update, :destroy]

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

  def show

  end

  def edit

  end

  def update
    if @attendee.update(params_attendee)
      flash[:notice] ='修改成功'
      redirect_to event_attendee_path(@event, @attendee)
    else
      render :edit
    end
  end

  def destroy
    @attendee.destroy
    flash[:alert] ='刪除成功'
    redirect_to event_attendees_path(@event)
  end

  private
  def set_attendee
    @attendee = @event.attendees.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def params_attendee
    params.require(:attendee).permit(:name)
  end
end
