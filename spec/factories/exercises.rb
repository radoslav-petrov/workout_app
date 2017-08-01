FactoryGirl.define do
  factory :exercise do
    duration_in_min 10
    workout 'Test workout'
    workout_date DateTime.current
  end
end