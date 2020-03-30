# frozen_string_literal: true

require 'faker'

FactoryGirl.define do
  factory :user do
    email 'user@user.com'
    password 'password'
  end
end
