require 'rails_helper'

describe AttendancesController do

  describe 'POST #create' do
    let!(:event) { FactoryGirl.create(:event) }
    let!(:user) { FactoryGirl.create(:user) }

      it 'assigns the event to be attended as @event' do
        sign_in user
        post :create, xhr: true, params: { event_id: event.id }
        expect(assigns[:event]).to eq event
      end

      it 'associates the event with the logged in user' do
        sign_in user
        post :create, xhr: true, params: { event_id: event.id }
        expect(assigns[:event].attendees).to include user
      end

  end

end
