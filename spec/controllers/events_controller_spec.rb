require 'rails_helper'

describe EventsController do
  let!(:event) { FactoryGirl.build(:event) }

  describe 'GET #index' do
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

  describe 'GET #new' do
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

  describe 'POST #create' do
    let(:valid_attributes) {
      FactoryGirl.build(:event).attributes
    }
    context 'when valid params are passed' do

      it 'creates a new event in the database' do
        expect {
          post :create,  { :event => valid_attributes }
        }.to change(Event, :count).by(1)
      end

      # it 'responds with a status code of 302' do
      #   expect(response.status).to eq 302
      # end


      it 'assigns the newly created event as @event' do
        expect(assigns[:event]).to eq(Event.last)
      end

      it 'redirects to the created event'do
        expect(response).to redirect_to "/events/#{Event.last.id}"
      end

    end

    xcontext 'when invalid params are passed' do
      before(:each) do
        post :create, { event: { title: 'this' } }
      end

      it 'responds with a status code of 422' do

      end

      it 'does not create a new event in the database' do

      end

      it 'assigns the unsaved event as @event' do

      end

      it 'renders the :new template' do

      end

    end
  end

end
