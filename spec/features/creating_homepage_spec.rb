# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Creating Home Page' do
  scenario do
    visit '/'

    expect(page).to have_content('Workout Lounge')
    expect(page).to have_link('Athletes Den')
    expect(page).to have_link('Home')
  end
end
