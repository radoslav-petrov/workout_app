# frozen_string_literal: true

class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.integer :duration_in_min
      t.text :workout
      t.date :workout_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
