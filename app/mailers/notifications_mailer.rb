# frozen_string_literal: true

class NotificationsMailer < ApplicationMailer
  default from: 'info@events.com'

  def notify_about_new_event(admin_email, event_id)
    @event = Event.find event_id

    mail(to: admin_email, subject: 'New event at events.com')
  end
end
