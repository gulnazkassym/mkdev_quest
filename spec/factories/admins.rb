# frozen_string_literal: true

require 'faker'

FactoryGirl.define do
  factory :admin do
    email 'admin@admin.com'
    password 'password'
  end
end
