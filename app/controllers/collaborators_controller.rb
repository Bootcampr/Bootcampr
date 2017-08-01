class CollaboratorsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @collaborator = User.find_by(email: params[:user][:email])
    @project.collaborators << @collaborator
    p '************************************************'
    p @project
    p@collaborator
    respond_to do |format|
      format.html { redirect_to project_path(@project) }
      format.js
    end

  end
end
