# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'builds full name' do
    user = build :user

    expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
  end
end
