# frozen_string_literal: true

class EventsController < ApplicationController
  EVENTS_PER_PAGE = 5

  def index
    @events = Event.by_status('published')
                   .page(params[:page]).per(EVENTS_PER_PAGE)
  end

  def show
    @event = Event.find params[:id]
  end

  def new
    @event = Event.new status: 'new'
  end

  def create
    @event = current_user.events.new event_params.merge(status: 'new')

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
      if admin_signed_in?
        @event.update(status: params[:status].presence)
        redirect_to admin_edit_event_path(@event),
                    flash: { success: t('event.successful_update') }
      else
        redirect_to @event, flash: { success: t('event.successful_update') }
      end
    else
      flash.now[:danger] = t('event.error_update')
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    if admin_signed_in?
      redirect_to authenticated_root_path anchor: 'archive'
    else
      redirect_to events_path
    end
  end

  def user_list
    @user_events = current_user.events
                               .by_status(params[:status])
                               .page(params[:page])
                               .per(EVENTS_PER_PAGE)
  end

  private

  def event_params
    params.require(:event).permit(
      :title, :description, :location, :start_time, :end_time, :organizer_email,
      :organizer_telegram, :link, :status
    )
  end
end
