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
    it { is_expected.to have_many(:attendances) }
    it { is_expected.to have_many(:events_to_attend) }
end

  describe '#full_name' do
    it 'returns the full name of a user' do
      user.first_name = 'Mikey'
      user.last_name = 'D'
      expect(user.full_name).to eq 'Mikey D'
    end
  end

end
