# frozen_string_literal: true

class Admin
  class EventsController < Admin::BaseController
    def index
      @events = Event.by_status(params[:status])
    end

    def edit
      @event = Event.find(params[:id])
    end
  end
end
