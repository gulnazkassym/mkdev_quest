require 'faker'

def create_events
  puts 'Creating events...'

  3.times do
    Event.create!(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      location: Faker::Address.street_address,
      start_time: Faker::Time.forward(23, :morning),
      end_time: Faker::Time.forward(24, :morning),
      organizer_email: Faker::Internet.email,
      organizer_telegram: 'user',
      link: 'https://example.com',
      user: User.all.first,
      status: 'new'
    )
  end

  3.times do
    Event.create!(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      location: Faker::Address.street_address,
      start_time: Faker::Time.forward(23, :morning),
      end_time: Faker::Time.forward(24, :morning),
      organizer_email: Faker::Internet.email,
      organizer_telegram: 'user',
      link: 'https://example.com',
      user: User.all.last,
      status: 'published'
    )
  end
end

def create_users
  puts 'Creating users...'

  2.times.map {{ email: Faker::Internet.email, password: Faker::Lorem.characters(6) }}.each do |user|
    puts "Email: #{user[:email]}, Password: #{user[:password]}"
    User.create!(user)
  end
end

def create_admin
  puts 'Creating admin...'

  Admin.create!(email: 'admin@admin.com', password: 'admin')
end

create_admin
create_users
create_events
