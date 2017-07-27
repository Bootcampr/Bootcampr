require 'rails_helper'

describe EventsController do
  let!(:event) { FactoryGirl.build(:event) }

  context 'GET #index' do
    before(:each) do
      get :index
    end

    it 'responds with a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'assigns all events as @events' do
      expect(assigns[:events]).to eq(Event.all)
    end

    it 'renders the :index template' do
      expect(response).to render_template :index
    end


  end

end
