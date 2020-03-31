# frozen_string_literal: true

class EventsController < ApplicationController
  EVENTS_PER_PAGE = 5

  def index
    @events = Event.page(params[:page]).per(EVENTS_PER_PAGE)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to @event, flash: { success: t('event.successful_create') }
    else
      flash.now[:danger] = t('event.error_create')
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event, flash: { success: t('event.successful_update') }
    else
      flash.now[:danger] = t('event.error_update')
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
