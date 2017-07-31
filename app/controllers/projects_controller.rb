class ProjectsController < ApplicationController
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
    # p params[:event_id]
    if @project.save
      p params
      p @project.id
      p params[:event_id]
      p "*" * 1000
      if params[:event_id]
        EventsProject.create(event_id: params[:event_id].to_i, project_id: @project.id)
        p EventsProject.last
      end
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
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :summary, :stack, :repository, :tag_list)
  end

end
