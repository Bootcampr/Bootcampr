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

describe 'GET #edit' do
  it "responds with status code 200" do
    get :edit, { id: test_event.id }
    expect(response).to have_http_status 200
  end

  it "assigns the correct event as @event" do
    get :edit, { id: test_event.id }
    expect(assigns(:event)).to eq(test_event)
  end

  it "renders the :edit template" do
    get :edit, { id: test_event.id }
    expect(response).to render_template(:edit)
  end
end

describe '#update' do
  let!(:new_attributes) { FactoryGirl.create(:event).attributes }

  it 'returns a status of 302' do
    patch :update, params: { id: test_event.id, event: new_attributes }
    test_event.reload
    expect(response).to have_http_status 302
  end

  it 'assigns @event' do
    patch :update, params: { id: test_event.id, event: new_attributes }
    expect(assigns[:event]).to eq test_event
  end

  it 'reassigns the events title' do
    patch :update, params: { id: test_event.id, event: new_attributes }
    test_event.reload
    expect(test_event.title).to eq 'MyString'
  end

  it 'reassigns the events summary' do
    patch :update, params: { id: test_event.id, event: new_attributes }
    test_event.reload
    expect(test_event.summary).to eq 'MyText'
  end

  it 'renders the event#show view' do
    patch :update, params: { id: test_event.id, event: new_attributes }
    expect(response.location).to include("/events/#{test_event.id}")
  end

  it 'renders the event#edit view if invalid' do
    patch :update, params: { id: test_event.id, event: { title: '' } }
    expect(response).to render_template(:edit)
  end

end

describe '#destroy' do
  before(:each) do
    event = FactoryGirl.create(:event)
    delete :destroy, params: { id: event.id }
  end

  it 'should return status 302' do
    expect(response.status).to eq 302
  end

  it 'changes the number of total Events' do
    expect(Event.all.length).to eq 0
  end
end

end
