require 'rest-client'
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end


  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    @user.tag_list = user_params[:tag_list]
    @user.save
    flash[:success] = "Updated profile"
    redirect_to @user
  end

  private

  def user_params

  params.require(:user).permit(:first_name, :last_name, :bootcamp, :location, :summary, :tag_list, :image, :email, :password, :github_handle, :twitter_handle, :website, :linkedin_handle)

  end
end
