require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do
  describe 'when not signed in' do
    it 'cannot view all exercises' do
      get :new, params: { user_id: 1 } 

      expect(response).to redirect_to(new_user_session_url)
    end

    it 'cannot create new exercise' do
      get :new, params: { user_id: 1 } 

      expect(response).to redirect_to(new_user_session_url)
    end
    
    it 'cannot save new exercise' do
      get :create, params: { user_id: 1 } 

      expect(response).to redirect_to(new_user_session_url)
    end

    it 'cannot view a exercise' do
      get :show, params: { id: 1, user_id: 1 } 

      expect(response).to redirect_to(new_user_session_url)
    end
  end

  describe 'when signed in' do
    let(:user) { create :user }

    before do
      sign_in user
    end

    describe 'creates exercise' do
      it 'creates new exercise' do
        exercise_attrs = attributes_for :exercise

        expect do
          post :create, params: { user_id: user.id, exercise: exercise_attrs }
        end.to change(Exercise, :count).by(1)
      end
    end
  end
end
