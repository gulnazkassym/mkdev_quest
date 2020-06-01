# frozen_string_literal: true

namespace :send_weekly_email do
  desc 'Sends weekly emails to subscribers about coming events'
  task weeks: :environment do
    today = Date.today
    email_list = User.confirmed.pluck(:email) + Subscriber.pluck(:email)
    NotificationsMailer.with(
      email_list: email_list,
      week: today..today + 7.days
    ).send_weekly_newsletter
  end
end
