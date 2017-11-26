# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name 'FirstName'
    last_name 'LastName'
    sequence(:email) { |n| "john#{n}@example.com" }
    password 'password'
  end
end
