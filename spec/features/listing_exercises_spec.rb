require 'rails_helper'

RSpec.feature 'Listing Exercises' do
  before do
    @user = User.create(email: 'email@example.com', password: 'password')
    login_as(@user)

    @first_exercise = @user.exercises.create(duration_in_min: 10, workout: 'First exercise', workout_date: '2017-01-01')
    @second_exercise = @user.exercises.create(duration_in_min: 20, workout: 'Second exercise', workout_date: '2017-01-02')
  end

  scenario 'shows user\'s workout for last 7 days' do
    visit '/'

    click_link 'My Lounge'

    expect(page).to have_content(@first_exercise.duration_in_min)
    expect(page).to have_content(@first_exercise.workout)
    expect(page).to have_content(@first_exercise.workout_date)
    expect(page).to have_content(@second_exercise.duration_in_min)
    expect(page).to have_content(@second_exercise.workout)
    expect(page).to have_content(@second_exercise.workout_date)
  end

end
