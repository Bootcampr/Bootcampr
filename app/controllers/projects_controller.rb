class ProjectsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :require_permission, :only => [:edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    p params
    if params[:event_id]
      @event = Event.find([params[:event_id]])
    end
  end

  def create
    @project = Project.new(project_params)
    @project.tag_list = project_params[:tag_list]
    @project.owner = current_user

    if @project.save
      if params[:event_id]
        EventsProject.create(event_id: params[:event_id].to_i, project_id: @project.id)
      end
      if Rails.env == 'production'
        $twitter.update("Contribute to #{@project.title}, a project hosted by Bootcampr: http://bootcampr.herokuapp.com/projects/#{@project.id}")
      end
      flash[:notice] = "You created a new project."
      redirect_to @project
    else
      render :new, status: 422
    end
  end

  def edit
    @project = Project.find(params[:id])
    render :edit
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "You updated your project."
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "You removed your project."
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :summary, :stack, :repository, :tag_list, :image)
  end

  def require_permission
    if current_user != Project.find(params[:id]).owner
      redirect_to root_path
    end
  end

end
