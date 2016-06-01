class EventsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def index
    @events = current_user.events.order('id desc')
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
    @artist = @event.user
    @events = []
  end

  def edit
    @event = current_user.events.find_by_id(params[:id])
  end

  def update
    @event = current_user.events.find_by_id(params[:id])
    if @event.update_attributes(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    event = current_user.events.find_by_id(params[:id])
    event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit!
  end
end
