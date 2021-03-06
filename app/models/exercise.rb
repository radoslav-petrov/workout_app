# frozen_string_literal: true

class Exercise < ApplicationRecord
  belongs_to :user

  validates :duration_in_min, presence: true
  validates :duration_in_min, numericality: {only_integer: true}
  validates :workout, presence: true
  validates :workout_date, presence: true
  validates :user_id, presence: true
end
