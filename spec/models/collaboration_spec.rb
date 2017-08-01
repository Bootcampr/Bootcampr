require 'rails_helper'

RSpec.describe Collaboration, type: :model do

  context 'associations' do
    it { is_expected.to belong_to(:collaborator) }
    it { is_expected.to belong_to(:project) }
  end

end
