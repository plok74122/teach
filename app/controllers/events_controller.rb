class EventsController < ApplicationController
  before_action :set_event, :except => [:index, :new, :create]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = '新增成功'
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
    @title = @event.name
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:alert] = '修改成功'
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :category_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
