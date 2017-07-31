require 'rails_helper'

RSpec.describe Attendance, type: :model do
  
  context 'associations' do
    it { is_expected.to belong_to(:attendee) }
    it { is_expected.to belong_to(:event) }
  end

end
