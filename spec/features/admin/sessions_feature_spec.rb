# frozen_string_literal: true

require 'rails_helper'

feature 'Sessions' do
  describe 'admin sign in' do
    let(:admin) { create :admin }
    scenario 'with valid values' do
      visit new_admin_session_path

      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_on 'Sign in'

      expect(page).to have_content('Signed in successfully.')
    end

    scenario 'with invalid values' do
      visit new_admin_session_path

      fill_in 'Email', with: admin.email
      fill_in 'Password', with: 'passsssssword'
      click_on 'Sign in'

      expect(page).to have_content('Invalid Email or password.')
    end
  end
end
