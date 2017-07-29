require 'rails_helper'

describe EventsController do
  let(:test_event) { Event.create(title: 'title', date: '2017-07-27', time: '2000-01-01 23:51:12', location: 'sea', summary: 'that', owner_id: 1) }
  let!(:event) { FactoryGirl.build(:event) }
  let!(:user) { FactoryGirl.create(:user) }

  describe 'GET #index' do
    before(:each) do
      get :index
    end

    it 'responds with a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'assigns all events as @events' do
      expect(assigns[:events]).to eq(Event.all.order(:date, :time))
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
      FactoryGirl.create(:event).attributes
    }
    context 'when valid params are passed' do

      it 'creates a new event in the database' do
        expect {
          post :create,  { :event => valid_attributes }
        }.to change(Event, :count).by(1)
      end

      it 'assigns the newly created event as @event' do
        expect(assigns[:event]).to eq(Event.last)
      end

      it 'redirects to the created event'do
      sign_in user
      post :create,  { :event => valid_attributes }
      expect(response.location).to include("/events/#{Event.last.id}")
    end

  end

  context 'when invalid params are passed' do
    before(:each) do
      post :create, { event: { title: 'this' } }
    end

    it 'responds with a status code of 422' do
      expect(response).to have_http_status(422)
    end

    it 'does not create a new event in the database' do
      expect { post :create, { event: { title: 'this' } } }.to_not change(Event, :count)
    end

    it 'assigns the unsaved event as @event' do
      expect(assigns[:event]).to be_a(Event)
    end

    it 'renders the :new template' do
      expect(response).to render_template :new
    end

  end
end

describe 'GET #show' do
  it "responds with status code 200" do
    get :show, { id: test_event.id }
    expect(response).to have_http_status 200
  end

  it "assigns the correct event as @event" do
    get :show, { id: test_event.id }
    expect(assigns(:event)).to eq(test_event)
  end

  it "renders the :show template" do
    get :show, { id: test_event.id }
    expect(response).to render_template(:show)
  end

end

end
