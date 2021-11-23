require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should have_many(:comments) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of :user_id }
  end
end
