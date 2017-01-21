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
      redirect_to :controller => 'events' , :action => 'show' , :id => @event
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
    if @event.update(params.require(:event).permit(:name, :description))
      redirect_to :controller => 'events' , :action => 'show' , :id => @event
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to :controller => 'events' , :action => 'index'
  end
end
