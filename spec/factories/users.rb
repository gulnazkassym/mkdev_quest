# frozen_string_literal: true

require 'faker'

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now
  end
end
