class PagesController < ApplicationController
  def index
    @user = User.new
    @events = Event.all
    @upcoming_events = Event.order(date: :asc).limit(5)
    @recent_projects = Project.order(created_at: :desc).limit(5)
  end

  def news
    request = RestClient.get 'https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=1c1b02c0aa584baab7868f0785dce659'
    news = JSON.parse(request.body)
    @articles = []
    news['articles'].each do |article|
      @articles << article
    end
    render :news_pages
  end

end
