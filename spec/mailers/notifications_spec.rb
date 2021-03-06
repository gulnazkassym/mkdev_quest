# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NotificationsMailer, type: :mailer do
  let(:admin) { create :admin }
  let(:user)  { create :user }
  let(:event) { create :event, user: user }

  let(:new_event_mail) do
    NotificationsMailer.notify_about_new_event(admin.email, event.id)
  end

  describe 'notifications' do
    it 'new event' do
      expect(new_event_mail.subject).to eq('New event at events.com')
      expect(new_event_mail.to).to include(admin.email)
    end
  end
end
