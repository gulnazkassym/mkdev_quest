# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validates presence' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:location) }
  end

  describe 'validates length' do
    it { should validate_length_of(:title).is_at_least(6) }
    it { should validate_length_of(:description).is_at_most(350) }
  end

  describe 'event associations' do
    it { should belong_to(:user) }
  end
end
