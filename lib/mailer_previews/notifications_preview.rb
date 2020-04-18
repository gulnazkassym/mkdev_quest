# frozen_string_literal: true
include EventsHelper

class NotificationsPreview < ActionMailer::Preview
  def notify_about_new_event
    NotificationsMailer.notify_about_new_event(Admin.pluck(:email), Event.first.id)
  end

  def send_weekly_newsletter
    email_list = Subscriber.pluck(:email)
    today = Date.today
    NotificationsMailer.with(email_list: email_list, week: today..today + 7.days).send_weekly_newsletter
  end
end
