class CollaboratorsController < ApplicationController
  def create
    @project = Project.find(params[:event_id])
    @collaborator = User.find(current_user.id)
    @project.collaborators << @collaborator

    respond_to do |format|
      format.html { redirect_to project_path(@project) }
      format.js
    end

  end
end
