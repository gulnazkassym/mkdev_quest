require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'should require title' do
    event = Event.new(title: nil, description: 'Some event.', location: 'Smart Point')
    expect(event).to_not be_valid
  end

  it 'should require description' do
    event = Event.new(title: 'Ruby MeetUp', description: nil, location: 'Smart Point')
    expect(event).to_not be_valid
  end

  it 'should require location' do
    event = Event.new(title: 'Ruby MeetUp', description: 'Some event.', location: nil)
    expect(event).to_not be_valid
  end

  it 'should create event' do
    event = Event.new(title: 'Ruby MeetUp', description: 'Some event.', location: 'Smart Point')
    expect(event).to be_valid
  end
end
