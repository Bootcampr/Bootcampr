class CollaboratorsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @user = User.find(current_user.id)
    @project.collaborators << @user

    respond_to do |format|
      format.html { redirect_to project_path(@project) }
      format.js
    end

  end
end
