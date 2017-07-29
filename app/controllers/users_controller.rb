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
    if @user.update_attributes(user_params)
      flash[:success] = "Updated profile"
      sign_in @user
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bootcamp, :location, :summary)
  end
end
