require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }


  describe '#show' do
    before(:each) { get :show, params: { id: User.first.id } }

    it 'returns a status of 200' do
      expect(response).to have_http_status 200
    end

    it 'assigns @user' do
      expect(assigns[:user]).to eq User.first
    end

    it 'renders the users#show view' do
      expect(response).to render_template :show
    end
  end

  describe '#edit' do
    before(:each) { get :edit, params: { id: User.first.id } }

    it 'returns a status of 200' do
      expect(response).to have_http_status 200
    end

    it 'assigns @users' do
      expect(assigns[:project]).to eq User.first
    end

    it 'renders the users#show view' do
      expect(response).to render_template :edit
    end
  end
end
