require 'rest-client'
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # p RestClient.get "https://api.github.com/user?client_id=#{ENV['APP_ID']}&client_secret=#{ENV['APP_SECRET']}"
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
    params.require(:user).permit(:first_name, :last_name, :bootcamp, :location, :summary, :tag_list, :email, :password, :github, :twitter, :website, :linkedin, :image)
  end
end
