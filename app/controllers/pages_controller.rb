class PagesController < ApplicationController
  def index
    @upcoming_events = Event.order(date: :desc).limit(5)
    @recent_projects = Project.order(created_at: :desc).limit(5)
  end
end
