# frozen_string_literal: true

require 'faker'

FactoryGirl.define do
  factory :subscriber do
    email Faker::Internet.email
  end
end
