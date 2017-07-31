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

  describe 'GET #new' do
    before(:each) do
      get :new
    end

    it 'responds with a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'assigns a new project to @project' do
      expect(assigns[:project]).to be_a_new(Project)
    end

    it 'renders the :new template' do
      expect(response).to render_template :new
    end

  end


  describe 'POST #create' do
    let(:valid_attributes) { FactoryGirl.build(:project).attributes }
    context 'when valid params are passed' do

      it 'creates a new project in the database' do
        sign_in user
        expect { post :create,  { :project => valid_attributes }
        }.to change(Project, :count).by(1)
      end

      it 'assigns the newly created project as @project' do
        sign_in user
        post :create,  { :project => valid_attributes }
        expect(assigns[:project]).to eq(Project.last)
      end

      it 'redirects to the created project'do
        sign_in user
        post :create,  { :project => valid_attributes }
        expect(response).to redirect_to "/projects/#{Project.last.id}"
      end

    end

    context 'when invalid params are passed' do
      before(:each) do
        post :create, { project: { title: 'this' } }
      end

      it 'responds with a status code of 422' do
        expect(response).to have_http_status(422)
      end

      it 'does not create a new project in the database' do
        expect { post :create, { project: { title: 'this' } } }.to_not change(Project, :count)
      end

      it 'assigns the unsaved project as @project' do
        expect(assigns[:project]).to be_a(Project)
      end

      it 'renders the :new template' do
        expect(response).to render_template :new
      end

    end
  end

  describe '#edit' do
    before(:each) { get :edit, params: { id: project.id } }

    it 'returns a status of 200' do
      expect(response).to have_http_status 200
    end

    it 'assigns @project' do
      expect(assigns[:project]).to eq project
    end

    it 'renders the users#show view' do
      expect(response).to render_template :edit
    end
  end

  describe '#update' do
    let!(:new_attributes) { FactoryGirl.create(:project).attributes }

    it 'returns a status of 302' do
      patch :update, params: { id: project.id, project: new_attributes }
      expect(response).to have_http_status 302
    end

    it 'assigns @project' do
      patch :update, params: { id: project.id, project: new_attributes }
      expect(assigns[:project]).to eq project
    end

    it 'reassigns the project title' do
      patch :update, params: { id: project.id, project: new_attributes }
      project.reload
      expect(project.title).to eq 'MyString'
    end

    it 'reassigns the project summary' do
      patch :update, params: { id: project.id, project: new_attributes }
      project.reload
      expect(project.summary).to eq 'MyText'
    end

    it 'renders the project#show view' do
      patch :update, params: { id: project.id, project: new_attributes }
      expect(response.location).to include("/projects/#{project.id}")
    end

    it 'renders the project#edit view if invalid' do
      patch :update, params: { id: project.id, project: { title: '' } }
      expect(response).to render_template(:edit)
    end
  end

  describe '#destroy' do

    before(:each) { delete :destroy, params: { id: project.id } }

    it 'returns status of 302' do
      expect(response.status).to eq 302
    end

    it 'changes the number of total Projects' do
      expect(Project.all.length).to eq(0)
    end

  end

end
