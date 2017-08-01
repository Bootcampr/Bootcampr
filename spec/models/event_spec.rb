require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:test_event) { Event.create(title: 'title', date: '2300-07-27', time: '2300-01-01 23:51:12', location: 'sea', summary: 'that') }
  let!(:user) { FactoryGirl.create(:user) }
  let(:test_invalid_event) { Event.create(title: 'title', date: '2017-07-27', time: '2000-01-01 23:51:12', location: 'sea', summary: 'that') }

  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:time) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:summary) }
    it 'does not validate an event with a date in the past' do
      expect(test_invalid_event.errors.full_messages).to include "Date has to be in the future. We're still working on time-traveling."
    end
    # it 'does validate an event with a date of today' do
    #   sign_in user
    #   let(:test_event) { Event.create(title: 'title', date: Date.today, time: '2300-01-01 23:51:12', location: 'sea', summary: 'that') }
    #   expect(test_event).to be_valid
    # end
    # it 'does validate an event with a date in the future' do
    #   sign_in user
    #   expect(test_event).to be_valid
    # end

  end

  it '#format_time' do
    expect(test_event.format_time).to eq '11:51 PM'
  end

  it '#format_date' do
    expect(test_event.format_date).to eq '07/27/2300'
  end

  it '#month' do
    expect(test_event.month).to eq '07'
  end

  context 'associations' do
    it { is_expected.to belong_to(:owner) }
    it { is_expected.to have_many :events_projects }
    it { is_expected.to have_many :projects }
    it { is_expected.to have_many :attendances }
    it { is_expected.to have_many :attendees }
  end
end
