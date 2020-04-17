# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'event associations' do
    it { should have_many(:events) }
    it { should have_many(:taggings) }
  end
end
