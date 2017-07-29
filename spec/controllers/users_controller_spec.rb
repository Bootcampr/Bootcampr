require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }

  describe '#show' do
    before(:each) { get :show, params: { id: user.id } }

    it 'returns a status of 200' do
      expect(response).to have_http_status 200
    end

    it 'assigns @user' do
      expect(assigns[:user]).to eq user
    end

    it 'renders the users#show view' do
      expect(response).to render_template :show
    end
  end

  describe '#edit' do
    before(:each) { get :edit, params: { id: user.id } }

    it 'returns a status of 200' do
      expect(response).to have_http_status 200
    end

    it 'assigns @users' do
      expect(assigns[:user]).to eq user
    end

    it 'renders the users#show view' do
      expect(response).to render_template :edit
    end
  end

  describe '#update' do
    let!(:test_user) { User.create(email: 'asdf@asdf.com', password: 'hellossd') }
    let!(:new_attributes) { FactoryGirl.create(:user).attributes }
    # before(:each) { patch :update, params: { id: user.id, user: new_attributes } }

    it 'returns a status of 302' do
      expect(response).to have_http_status 302
    end

    it 'assigns @users' do
      sign_in user
      expect(assigns[:user]).to eq user
    end

    it 'reassigns the users first name' do
      patch :update, params: { id: test_user.id, user: new_attributes }
      test_user.reload
      expect(test_user.first_name).to eq 'Barak'
    end

    it 'reassigns the users last name' do
      patch :update, params: { id: test_user.id, user: new_attributes }
      test_user.reload
      expect(test_user.last_name).to eq 'Obama'
    end

    it 'renders the users#show view' do
      expect(response).to render_template :show
    end
  end
end
