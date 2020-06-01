# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  describe 'validates email' do
    it { should validate_presence_of(:email) }

    subject { create(:subscriber) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
end
