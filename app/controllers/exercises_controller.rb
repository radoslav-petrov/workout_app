# frozen_string_literal: true

class ExercisesController < ApplicationController
  before_action :authenticate_user!

  def index
    @exercises = current_user.exercises.all
  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)

    if @exercise.save
      flash[:success] = 'Exercise has been created'
      redirect_to [current_user, @exercise]
    else
      flash.now[:danger] = 'Exercise has not been created'
      render :new
    end
  end

  def show
    @exercise = find_exercise
  end

  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_min,
                                     :workout,
                                     :workout_date,
                                     :user_id)
  end

  def find_exercise
    current_user.exercises.find(params[:id])
  end
end
