require 'rest-client'
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # p RestClient.get "https://api.github.com/user?client_id=#{ENV['APP_ID']}&client_secret=#{ENV['APP_SECRET']}"
  end
end
