require 'rails_helper'

describe PagesController do

  let!(:event1) { FactoryGirl.create(:event) }
  let!(:event2) { FactoryGirl.create(:event) }
  let!(:event3) { FactoryGirl.create(:event) }
  let!(:event4) { FactoryGirl.create(:event) }
  let!(:event5) { FactoryGirl.create(:event) }

  let!(:project1) { FactoryGirl.create(:project) }
  let!(:project2) { FactoryGirl.create(:project) }
  let!(:project3) { FactoryGirl.create(:project) }
  let!(:project4) { FactoryGirl.create(:project) }
  let!(:project5) { FactoryGirl.create(:project) }

  describe 'GET #index' do
    before(:each) do
      get :index
    end

    it 'responds with a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'assigns upcoming events as @upcoming_events' do
      expect(assigns[:upcoming_events]).to eq(Event.order(date: :asc).limit(5))
    end

    it 'only assigns 5 upcoming events to upcoming events' do
      expect(assigns[:upcoming_events].length).to eq(5)
    end

    it 'assigns recent projects as @recent_projects' do
      expect(assigns[:recent_projects]).to eq(Project.order(created_at: :desc).limit(5))
    end

    it 'only assigns 5 recent projects to recent projects' do
      expect(assigns[:recent_projects].length).to eq(5)
    end

    it 'renders the index page' do
      expect(response).to render_template(:index)
    end

  end



end
