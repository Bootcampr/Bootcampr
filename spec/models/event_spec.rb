require 'rails_helper'

RSpec.describe Event, type: :model do

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:time) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:summary) }
  describe 'associations' do
    it { is_expected.to belong_to(:owner) }
  end
end
