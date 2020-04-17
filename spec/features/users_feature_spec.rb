# frozen_string_literal: true

require 'rails_helper'

feature 'User' do
  describe 'user registration' do
    xscenario 'with valid values' do
      visit new_user_registration_path

      within('#new_user') do
        fill_in 'Email', with: 'user@user.com'
        fill_in 'Password', with: 'password', match: :prefer_exact
        fill_in 'Password confirmation', with: 'password', match: :prefer_exact
        click_on 'Sign up'
        # binding.pry
        user = User.find_by_email('user@user.com')
        user.confirm
      end

      expect(page).to have_content(
        'A message with a confirmation link has been sent to your email address'
      )
    end

    scenario 'with not matching passwords' do
      visit new_user_registration_path

      within('#new_user') do
        fill_in 'Email', with: 'user@user.com'
        fill_in 'Password', with: 'password', match: :prefer_exact
        fill_in 'Password confirmation', with: 'passwor', match: :prefer_exact
        click_on 'Sign up'
      end

      expect(page).to have_content(
        'Password confirmation doesn\'t match Password'
      )
    end

    scenario 'with short password' do
      visit new_user_registration_path

      within('#new_user') do
        fill_in 'Email', with: 'user@user.com'
        fill_in 'Password', with: 'pass', match: :prefer_exact
        fill_in 'Password confirmation', with: 'pass', match: :prefer_exact
        click_on 'Sign up'
      end

      expect(page).to have_content('Password is too short')
    end

    scenario 'with missed values' do
      visit new_user_registration_path

      within('#new_user') do
        click_on 'Sign up'
      end

      expect(page).to have_content('Email can\'t be blank')
      expect(page).to have_content('Password can\'t be blank')
    end
  end

  describe 'user sign in' do
    let(:user) { create :user }
    scenario 'with valid values' do
      visit new_user_session_path

      within('#new_user') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_on 'Sign in'
      end

      expect(page).to have_content('Signed in successfully.')
    end

    scenario 'with invalid values' do
      visit new_user_session_path

      within('#new_user') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'passsssssword'
        click_on 'Sign in'
      end

      expect(page).to have_content('Invalid Email or password.')
    end
  end
end
