require 'rails_helper'

RSpec.describe Exercise, type: :model do
  let(:exercise) { build :exercise }

  describe '(validations)' do
    subject { exercise }

    it { should validate_presence_of(:duration_in_min) }
    it { should validate_numericality_of(:duration_in_min) }
    it { should validate_presence_of(:workout) }
    it { should validate_presence_of(:workout_date) }
    it { should validate_presence_of(:user_id) }
  end
end
