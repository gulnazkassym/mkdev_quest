# frozen_string_literal: true

require 'faker'

FactoryGirl.define do
  factory :event do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    location Faker::Address.street_address
    start_time '2020-07-25 11:00:00 UTC'
    end_time '2020-07-25 17:00:00 UTC'
    organizer_email Faker::Internet.email
    organizer_telegram 'user'
    link 'https://example.com'
  end
end
