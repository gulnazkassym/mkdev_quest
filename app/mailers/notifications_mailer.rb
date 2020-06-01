# frozen_string_literal: true

class NotificationsMailer < ApplicationMailer
  default from: 'info@events.com'
  UPCOMING_EVENTS_LIMIT = 6

  def notify_about_new_event(admin_email, event_id)
    @event = Event.find event_id

    mail(to: admin_email, subject: 'New event at events.com')
  end

  def send_weekly_newsletter
    email_list = params[:email_list]
    week = params[:week]
    @upcoming_events = Event.published
                            .where(start_time: week)
                            .limit(UPCOMING_EVENTS_LIMIT)

    email_list.each do |email|
      @email = email
      mail(to: email, subject: 'Weekly digest')
    end
  end
end
