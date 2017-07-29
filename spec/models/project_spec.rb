require 'rails_helper'

RSpec.describe Project, type: :model do
  context '#validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :summary }
  end

  context '#associations' do
    it { is_expected.to belong_to :owner }
    it { is_expected.to have_many :events }
  end
end
