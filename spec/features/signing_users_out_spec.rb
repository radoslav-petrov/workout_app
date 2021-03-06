# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users Sign Out' do
  before do
    user = create :user
    login_as(user)
  end

  scenario 'via Sign out link' do
    visit '/'

    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully.')
  end
end
