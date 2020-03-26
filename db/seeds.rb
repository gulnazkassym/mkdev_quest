require 'faker'

def create_events
  puts 'Creating events...'

  6.times do
    Event.create!(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      location: Faker::Address.street_address,
      start_time: Faker::Time.forward(23, :morning),
      end_time: Faker::Time.forward(24, :morning),
      organizer_email: Faker::Internet.email,
      organizer_telegram: 'user',
      link: 'https://example.com'
    )
  end
end

create_events
