# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsHelper, type: :helper do
  describe '#date_formatter' do
    let(:user) { create :user }
    let(:event) { create :event, user: user }

    it 'returns formatted date' do
      expect(helper.date_formatter(event.start_time)).to eq(
        'Sat, 25 Jul 2020 11:00'
      )
    end
  end
end
