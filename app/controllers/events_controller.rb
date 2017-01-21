class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params.require(:event).permit(:name, :description))
    if @event.save
      redirect_to :controller => 'events' , :action => 'show'
    end
  end
end
