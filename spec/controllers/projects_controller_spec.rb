require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe '#index' do
    before(:each) { get :index }

    it 'returns a status of 200' do
      expect(response).to have_http_status 200
    end

    it 'assigns @projects' do
      expect(assigns[:projects]).to eq Project.all
    end

    it 'renders the events#index view' do
      expect(response).to render_template 'index'
    end
  end
end
