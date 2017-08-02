class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = @user.events.order(:date, :time)
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

  def subscriptions
    @user = User.find(params[:id])
    if @user == current_user
      @user.subscribed = !@user.subscribed
      @user.save
    else
      redirect_to user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bootcamp, :location, :summary, :tag_list, :image, :email, :password, :github_handle, :twitter_handle, :website, :linkedin_handle)
  end
end
