# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user associations' do
    it { should have_many(:events) }
  end

  describe 'validates presence' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'validates length' do
    it { should validate_length_of(:password).is_at_least(6) }
  end
end
