require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project) }

  describe '#index' do
    before(:each) { get :index }

    it 'returns a status of 200' do
      expect(response).to have_http_status 200
    end

    it 'assigns @projects' do
      expect(assigns[:projects]).to eq Project.all
    end

    it 'renders the projects#index view' do
      expect(response).to render_template :index
    end
  end

  describe '#show' do
    before(:each) { get :show, params: { id: Project.first.id } }

    it 'returns a status of 200' do
      expect(response).to have_http_status 200
    end

    it 'assigns @projects' do
      expect(assigns[:project]).to eq Project.first
    end

    it 'renders the projects#show view' do
      expect(response).to render_template :show
    end
  end
end
