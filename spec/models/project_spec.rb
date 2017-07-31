require 'rails_helper'

RSpec.describe Project, type: :model do
  let!(:test_project) { Project.new(title: 'test', summary: 'test test', repository: 'http://google.com') }
  context '#validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :summary }
    it 'repository is not valid unless it is a GitHub URL' do
      expect(test_project).to_not be_valid
    end
  end

  context '#associations' do
    it { is_expected.to belong_to :owner }
  end

end
