# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Creating Exercise' do
  before do
    @user = User.create(email: 'email@example.com', password: 'password')
    login_as(@user)
  end

  scenario 'with valid inputs' do
    visit '/'

    click_link 'My Lounge'
    click_link 'New Workout'

    fill_in 'Duration', with: 10
    fill_in 'Workout Details', with: 'Details for workout'
    fill_in 'Activity Date', with: '2015-08-07'
    click_button 'Create Exercise'

    expect(page).to have_content('Exercise has been created')

    latest_exercise = Exercise.last
    expect(page.current_path).to eq(user_exercise_path(@user, latest_exercise))
  end

  scenario 'with invalid inputs' do
    visit '/'

    click_link 'My Lounge'
    click_link 'New Workout'

    fill_in 'Duration', with: nil
    fill_in 'Workout Details', with: ''
    fill_in 'Activity Date', with: ''
    click_button 'Create Exercise'

    expect(page).to have_content('Exercise has not been created')
    expect(page).to have_content('Duration in min can\'t be blank')
    expect(page).to have_content('Duration in min is not a number')
    expect(page).to have_content('Workout can\'t be blank')
    expect(page).to have_content('Workout date can\'t be blank')
  end
end
