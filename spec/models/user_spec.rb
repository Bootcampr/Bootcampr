require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.build(:user) }

  describe '#validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end
  
  describe '#associations' do
    it { is_expected.to have_many :projects }
    it { is_expected.to have_many(:events) }

  end
end
