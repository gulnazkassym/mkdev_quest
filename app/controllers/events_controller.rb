class EventsController < ApplicationController
  EVENTS_PAGINATION = 5

  def index
    @events = Event.page(params[:page]).per(EVENTS_PAGINATION)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, flash: { success: 'Event successfully created' }
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event, flash: { success: 'Event successfully updated' }
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :start_time, :end_time, :organizer_email, :organizer_telegram, :link)
  end
end
