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

  context 'GET #new' do
    before(:each) do
      get :new
    end

    it 'responds with a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'assigns a new event to @event' do
      expect(assigns[:event]).to be_a_new(Event)
    end

    it 'renders the :new template' do
      expect(response).to render_template :new
    end

  end

end
