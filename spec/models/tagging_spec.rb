# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe 'event associations' do
    it { should belong_to(:event) }
    it { should belong_to(:tag) }
  end
end
