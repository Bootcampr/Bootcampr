require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  let(:tag) { Tag.create(name: 'test') }

  describe '##index' do
    before(:each) { get :index }

    it 'returns a status of 200' do
      expect(response).to have_http_status 200
    end

    it 'assigns @tags' do
      expect(assigns[:tags]).to eq Tag.all
    end

    it 'renders the tags#index view' do
      expect(response).to render_template :index
    end
  end

  describe '#show' do
    before(:each) { get :show, params: { id: tag.id } }

    it 'returns a status of 200' do
      expect(response).to have_http_status 200
    end

    it 'assigns @tag' do
      expect(assigns[:tag]).to eq tag
    end

    it 'renders the users#show view' do
      expect(response).to render_template :show
    end
  end
end
