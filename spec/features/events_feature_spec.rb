# frozen_string_literal: true

require 'rails_helper'

feature 'Event' do
  let!(:user)  { create :user }
  let!(:event) { create :event, title: 'Ruby MeetUp 2020', user: user }

  describe 'event list' do
    scenario 'authorized user' do
      login_as(user, scope: :user)
      visit events_path
      expect(page).to have_link('Edit')
      expect(page).to have_link('Delete')
    end

    scenario 'unauthorized user' do
      visit events_path
      expect(page).to_not have_link('Edit')
      expect(page).to_not have_link('Delete')
    end
  end

  describe 'create new event' do
    before { login_as(user, scope: :user) }

    scenario 'with valid values' do
      visit new_event_path
      fill_in 'Title', with: 'Ruby MeetUp 2020'
      fill_in 'Description', with: 'Lorem Ipsum is simply dummy text.'
      fill_in 'Location', with: '221b, Baker Street'
      click_on 'Create Event'
      expect(page).to have_content('Ruby MeetUp 2020')
      expect(page).to have_content('Lorem Ipsum is simply dummy text.')
    end

    scenario 'with invalid values' do
      visit new_event_path
      fill_in 'Title', with: 'Ruby'
      fill_in 'Description', with: 'Lorem Ipsum is simply dummy text.'
      click_on 'Create Event'
      expect(page).to have_content('Title is too short')
      expect(page).to have_content('Location can\'t be blank')
    end
  end

  describe 'shows the event' do
    scenario 'authorized user' do
      login_as(user, scope: :user)
      visit events_path
      click_on event.title
      expect(page).to have_content(event.description)
      expect(page).to have_link('Edit')
      expect(page).to have_link('Delete')
    end

    scenario 'unauthorized user' do
      visit events_path
      click_on event.title
      expect(page).to_not have_link('Edit')
      expect(page).to_not have_link('Delete')
    end
  end

  describe 'updates the event' do
    before { login_as(user, scope: :user) }

    scenario 'with valid values' do
      visit edit_event_path(event)
      fill_in 'Title', with: 'Holy JS 2020'
      click_on 'Update Event'
      expect(page).to have_content('Holy JS 2020')
      expect(page).not_to have_content('Ruby MeetUp 2020')
    end

    scenario 'with invalid values' do
      visit edit_event_path(event)
      fill_in 'Title', with: 'Holy'
      click_on 'Update Event'
      expect(page).to have_content('Title is too short')
    end
  end

  scenario 'destroys the event' do
    login_as(user, scope: :user)
    visit events_path
    click_on 'Delete'
    expect(page).not_to have_content('Ruby MeetUp 2020')
  end
end
