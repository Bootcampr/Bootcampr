class PagesController < ApplicationController
  def index
    @user = User.new
    @events = Event.all
    @upcoming_events = Event.order(date: :asc).limit(5)
    @recent_projects = Project.order(created_at: :desc).limit(5)
  end
end
