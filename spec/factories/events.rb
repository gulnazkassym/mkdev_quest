require 'faker'

FactoryGirl.define do
  factory :event do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    location Faker::Address.street_address
    starttime '2020-07-25 11:00:00 UTC'
    endtime '2020-07-25 17:00:00 UTC'
    organizeremail Faker::Internet.email
    organizertelegram 'user'
    link 'https://example.com'
  end
end
