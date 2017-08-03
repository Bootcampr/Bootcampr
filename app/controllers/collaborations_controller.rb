class CollaborationsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @collaborator = current_user
    @project.collaborators << @collaborator

    respond_to do |format|
      format.html { redirect_to project_path(@project) }
      format.js
    end

  end
end
