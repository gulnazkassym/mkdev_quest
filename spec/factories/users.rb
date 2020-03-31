# frozen_string_literal: true

require 'faker'

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password 'password'
  end
end
