class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.owner_id = current_user.id
    if @project.save
      redirect_to project_path(@project)
    else
      render :new, status: 422
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :summary, :stack, :repository)
  end

end
