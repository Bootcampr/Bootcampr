require 'rails_helper'

describe CollaborationsController do

  describe 'POST #create' do

    let!(:project) { FactoryGirl.create(:project) }
    let!(:user) { FactoryGirl.create(:user) }

      it 'assigns the project to be collaborated-on as @project' do
        sign_in user
        post :create, xhr: true, params: { project_id: project.id }
        expect(assigns[:project]).to eq project
      end

      it 'associates the project with the logged in user' do
        sign_in user
        post :create, xhr: true, params: { project_id: project.id }
        expect(assigns[:project].collaborators).to include user
      end

  end

end
